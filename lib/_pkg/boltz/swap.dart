import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:bb_mobile/_model/transaction.dart';
import 'package:bb_mobile/_model/wallet.dart';
import 'package:bb_mobile/_pkg/boltz/types.dart';
import 'package:bb_mobile/_pkg/consts/configs.dart';
import 'package:bb_mobile/_pkg/error.dart';
import 'package:bb_mobile/_pkg/storage/secure_storage.dart';
import 'package:bb_mobile/_pkg/storage/storage.dart';
import 'package:bb_mobile/_pkg/wallet/repository/network.dart';
import 'package:boltz_dart/boltz_dart.dart';
import 'package:convert/convert.dart';
import 'package:dio/dio.dart';
import 'package:lwk_dart/lwk_dart.dart' as lwk;

class SwapBoltz {
  SwapBoltz({
    required SecureStorage secureStorage,
    required Dio dio,
    required NetworkRepository networkRepository,
  })  : _secureStorage = secureStorage,
        _networkRepository = networkRepository,
        _dio = dio;

  final SecureStorage _secureStorage;
  final Dio _dio;
  final NetworkRepository _networkRepository;

  Future<(Invoice?, Err?)> decodeInvoice({
    required String invoice,
    String? boltzUrl,
  }) async {
    try {
      final res = await DecodedInvoice.fromString(
        s: invoice,
        boltzUrl: boltzUrl,
      );
      final inv = Invoice.fromDecodedInvoice(res, invoice);
      return (inv, null);
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }

  Future<(Fees?, Err?)> getFeesAndLimits({
    required String boltzUrl,
  }) async {
    try {
      final res = Fees(
        boltzUrl: 'https://' + boltzUrl,
      );
      return (res, null);
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }

  Future<(BoltzApi?, Err?)> initializeBoltzApi(bool isTestnet) async {
    try {
      final api = await BoltzApi.newBoltzApi(
        isTestnet ? boltzTestnet : boltzMainnet,
      );

      return (api, null);
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }

  Future<(SwapStatusResponse?, Err?)> getSwapStatus(
    String id,
    bool isTestnet,
  ) async {
    try {
      final url = isTestnet ? boltzTestnet : boltzMainnet;

      final res = await _dio.post('https://$url/swapstatus', data: {'id': id});

      final data = res.data['status'] as String;
      final status = getSwapStatusFromString(data);
      final resp = SwapStatusResponse(status: status);

      return (resp, null);
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }

  // Future<Err?> addSwapSubs({
  //   required BoltzApi api,
  //   required List<String> swapIds,
  //   required void Function(
  //     String id,
  //     SwapStreamStatus status,
  //   ) onUpdate,
  // }) async {
  //   try {
  //     final completer1 = Completer();

  //     api.subscribeSwapStatus(swapIds).listen((event) {
  //       onUpdate(event.id, event);
  //     });
  //     return null;
  //   } catch (e) {
  //     return Err(e.toString());
  //   }
  // }

  Future<(String?, Err?)> claimOrRefundSwap({
    required SwapTx swapTx,
    required Wallet wallet,
    required bool shouldRefund,
  }) async {
    try {
      final boltzurl =
          wallet.network == BBNetwork.Testnet ? boltzTestnet : boltzMainnet;

      final (fees, errFees) = await getFeesAndLimits(
        boltzUrl: boltzurl,
      );
      if (errFees != null) {
        throw errFees;
      }

      final isLiquid = wallet.baseWalletType == BaseWalletType.Liquid;

      final (swapSentive, err) = await _secureStorage.getValue(
        StorageKeys.swapTxSensitive + '_' + swapTx.id,
      );
      if (err != null) throw err;

      final swapSensitive = SwapTxSensitive.fromJson(
        jsonDecode(swapSentive!) as Map<String, dynamic>,
      );

      if (!shouldRefund) {
        // final DateTime now = DateTime.now();
        // final String formattedDate =
        //     '${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:${now.second}:${now.millisecond}';
        // final Random random = Random();
        // final int randomNumber = random.nextInt(
        //   10000,
        // ); // This will generate a random number between 0 and 9999

        // print('ATTEMPT CLAIMING: $randomNumber AT: $formattedDate');
        if (isLiquid) {
          final swapFees = await fees?.reverse();
          final claimFeesEstimate = swapFees?.lbtcFees.minerFees.claim;
          // jfinal claimFeesEstimate = fees?.lbtcReverse.claimFeesEstimate;
          if (claimFeesEstimate == null) throw 'Fees estimate not found';

          final swap = swapTx.toLbtcLnSwap(swapSensitive);

          final resp = await swap.claim(
            outAddress: swapTx.claimAddress!,
            absFee: claimFeesEstimate,
            tryCooperate: false,
          );
          return (resp, null);
        } else {
          final swapFees = await fees?.reverse();
          final claimFeesEstimate = swapFees?.btcFees.minerFees.claim;
          // final claimFeesEstimate = fees?.btcReverse.claimFeesEstimate;
          if (claimFeesEstimate == null) throw 'Fees estimate not found';

          final swap = swapTx.toBtcLnSwap(swapSensitive);

          final resp = await swap.claim(
            outAddress: swapTx.claimAddress!,
            absFee: claimFeesEstimate,
            tryCooperate: false,
          );

          return (resp, null);
        }
      } else {
        if (isLiquid) {
          final swapFees = await fees?.submarine();
          final refundFeesEstimate = swapFees?.btcFees.minerFees;
          // final refundFeesEstimate = fees?.lbtcSubmarine.claimFees;
          if (refundFeesEstimate == null) throw 'Fees estimate not found';

          final swap = swapTx.toLbtcLnSwap(swapSensitive);

          final resp = await swap.refund(
            outAddress: swapTx.claimAddress!,
            absFee: refundFeesEstimate,
            tryCooperate: false,
          );

          return (resp, null);
        } else {
          final swapFees = await fees?.submarine();
          final refundFeesEstimate = swapFees?.btcFees.minerFees;
          // final refundFeesEstimate = fees?.btcSubmarine.claimFees;
          if (refundFeesEstimate == null) throw 'Fees estimate not found';

          final swap = swapTx.toBtcLnSwap(swapSensitive);

          final resp = await swap.refund(
            outAddress: swapTx.claimAddress!,
            absFee: refundFeesEstimate,
            tryCooperate: false,
          );

          return (resp, null);
        }
      }
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }

  Future<Err?> deleteSwapSensitive({required String id}) async {
    try {
      final err = await _secureStorage
          .deleteValue(StorageKeys.swapTxSensitive + '_' + id);
      if (err != null) throw err;
      return null;
    } catch (e) {
      return Err(e.toString());
    }
  }

  ///
  ///
  /// ------------------------- V2 ------------------------------
  ///
  ///
  Future<(SwapTx?, Err?)> receive({
    required String mnemonic,
    required int index,
    required int outAmount,
    required Chain network,
    required String electrumUrl,
    required String boltzUrl,
    required bool isLiquid,
    required String claimAddress,
  }) async {
    try {
      late SwapTx swapTx;
      if (!isLiquid) {
        final res = await BtcLnSwap.newReverse(
          mnemonic: mnemonic,
          index: index,
          outAmount: outAmount,
          network: network,
          electrumUrl: electrumUrl,
          boltzUrl: boltzUrl,
          outAddress: claimAddress,
        );
        // final obj = res;

        final swapSensitive = res.createSwapSensitiveFromBtcLnSwap();
        // SwapTxSensitive.fromBtcLnSwap(res);
        final err = await _secureStorage.saveValue(
          key: StorageKeys.swapTxSensitive + '_' + res.id,
          value: jsonEncode(swapSensitive.toJson()),
        );
        if (err != null) throw err;
        swapTx =
            res.createSwapFromBtcLnSwap().copyWith(claimAddress: claimAddress);
        // SwapTx.fromBtcLnSwap(res);
      } else {
        final res = await LbtcLnSwap.newReverse(
          mnemonic: mnemonic,
          index: index,
          outAmount: outAmount,
          network: network,
          electrumUrl: electrumUrl,
          boltzUrl: boltzUrl,
          outAddress: claimAddress,
        );
        // final obj = res;

        final swapSensitive = res.createSwapSensitiveFromLbtcLnSwap();
        // SwapTxSensitive.fromLbtcLnSwap(res);
        final err = await _secureStorage.saveValue(
          key: StorageKeys.swapTxSensitive + '_' + res.id,
          value: jsonEncode(swapSensitive.toJson()),
        );
        if (err != null) throw err;
        swapTx =
            res.createSwapFromLbtcLnSwap().copyWith(claimAddress: claimAddress);
        // SwapTx.fromLbtcLnSwap(res);
      }

      return (swapTx, null);
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }

  Future<(SwapTx?, Err?)> send({
    required String mnemonic,
    required int index,
    required String invoice,
    required Chain network,
    required String electrumUrl,
    required String boltzUrl,
    required bool isLiquid,
  }) async {
    try {
      if (isLiquid) {
        final res = await LbtcLnSwap.newSubmarine(
          mnemonic: mnemonic,
          index: index,
          invoice: invoice,
          network: network,
          electrumUrl: electrumUrl,
          boltzUrl: boltzUrl,
        );

        final swapSensitive = res.createSwapSensitiveFromLbtcLnSwap();

        //SwapTxSensitive.fromBtcLnSwap(res);
        final err = await _secureStorage.saveValue(
          key: StorageKeys.swapTxSensitive + '_' + res.id,
          value: jsonEncode(swapSensitive.toJson()),
        );
        if (err != null) throw err;
        final swap = res.createSwapFromLbtcLnSwap();

        // SwapTx.fromBtcLnSwap(res);

        return (swap, null);
      } else {
        final res = await BtcLnSwap.newSubmarine(
          mnemonic: mnemonic,
          index: index,
          invoice: invoice,
          network: network,
          electrumUrl: electrumUrl,
          boltzUrl: boltzUrl,
        );

        final swapSensitive = res.createSwapSensitiveFromBtcLnSwap();

        //SwapTxSensitive.fromBtcLnSwap(res);
        final err = await _secureStorage.saveValue(
          key: StorageKeys.swapTxSensitive + '_' + res.id,
          value: jsonEncode(swapSensitive.toJson()),
        );
        if (err != null) throw err;
        final swap = res.createSwapFromBtcLnSwap();
        // SwapTx.fromBtcLnSwap(res);

        return (swap, null);
      }
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }

  Future<(String?, Err?)> broadcast({
    required SwapTx swapTx,
    required String signedBytes,
  }) async {
    try {
      if (!swapTx.isLiquid()) throw 'Only Liquid';

      final (swapSensitiveStr, err) = await _secureStorage.getValue(
        StorageKeys.swapTxSensitive + '_' + swapTx.id,
      );
      if (err != null) throw err;

      log('-----swap json\n' + swapSensitiveStr.toString() + '\n ------');
      final swapSensitive = SwapTxSensitive.fromJson(
        jsonDecode(swapSensitiveStr!) as Map<String, dynamic>,
      );

      final swap = swapTx.toLbtcLnSwap(swapSensitive);

      final txid = await swap.broadcastBoltz(signedHex: signedBytes);

      return (txid, null);
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }

  Future<(String?, Err?)> claimReverseSwap({
    required SwapTx swapTx,
    required Wallet wallet,
    required bool tryCooperate,
    bool broadcastViaBoltz = false,
  }) async {
    try {
      final address = wallet.lastGeneratedAddress?.address;
      if (address == null || address.isEmpty) throw 'Address not found';

      final isLiquid = wallet.baseWalletType == BaseWalletType.Liquid;

      final (swapSentive, err) = await _secureStorage.getValue(
        StorageKeys.swapTxSensitive + '_' + swapTx.id,
      );
      if (err != null) throw err;

      final swapSensitive = SwapTxSensitive.fromJson(
        jsonDecode(swapSentive!) as Map<String, dynamic>,
      );

      if (isLiquid) {
        final (blockchain, err) = _networkRepository.liquidUrl;
        if (err != null) throw err;

        // final claimFeesEstimate = fees?.lbtcReverse.claimFeesEstimate;
        // if (claimFeesEstimate == null) throw 'Fees estimate not found';
        final swap = swapTx.toLbtcLnSwap(swapSensitive);
        // .copyWith(electrumUrl: 'blockstream.info:995');

        // await Future.delayed(5.seconds);
        final signedHex = await swap.claim(
          outAddress: address,
          absFee: swapTx.claimFees!,
          tryCooperate: tryCooperate,
        );
        // locator<Logger>()
        //     .log('------${swapTx.id}-----\n$signedHex------signed-claim-----');
        if (broadcastViaBoltz) {
          final txid = await swap.broadcastBoltz(
            signedHex: signedHex,
          );
          return (txid, null);
        } else {
          try {
            final txid = await lwk.Wallet.broadcastTx(
              electrumUrl: blockchain!,
              txBytes: Uint8List.fromList(hex.decode(signedHex)),
            );
            return (txid, null);
          } catch (e) {
            print('Failed to broadcast transaction: $e');
            await Future.delayed(
              const Duration(
                seconds: 5,
              ),
            ); // this non-blocking delay is to accomodate mempool propogation if the first try failed.
            final txid = await lwk.Wallet.broadcastTx(
              electrumUrl: blockchain!,
              txBytes: Uint8List.fromList(hex.decode(signedHex)),
            );
            return (txid, null);
          }
        }
      } else {
        final boltzurl =
            wallet.network == BBNetwork.Testnet ? boltzTestnet : boltzMainnet;

        final (fees, errFees) = await getFeesAndLimits(
          boltzUrl: boltzurl,
        );
        if (errFees != null) {
          throw errFees;
        }

        final swapFees = await fees?.reverse();
        final claimFeesEstimate = swapFees?.btcFees.minerFees.claim;
        //final claimFeesEstimate = fees?.btcReverse.claimFeesEstimate;
        if (claimFeesEstimate == null) throw 'Fees estimate not found';

        final swap = swapTx.toBtcLnSwap(swapSensitive);

        final resp = await swap.claim(
          outAddress: address,
          absFee: claimFeesEstimate,
          tryCooperate: tryCooperate,
        );

        return (resp, null);
      }
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }

  Future<(String?, Err?)> refundSubmarineSwap({
    required SwapTx swapTx,
    required Wallet wallet,
    required bool tryCooperate,
    bool broadcastViaBoltz = false,
  }) async {
    try {
      final address = wallet.lastGeneratedAddress?.address;
      if (address == null || address.isEmpty) throw 'Address not found';

      final boltzurl =
          wallet.network == BBNetwork.Testnet ? boltzTestnet : boltzMainnet;

      final (fees, errFees) = await getFeesAndLimits(
        boltzUrl: boltzurl,
      );
      if (errFees != null) {
        throw errFees;
      }

      final isLiquid = wallet.baseWalletType == BaseWalletType.Liquid;

      final (swapSentive, err) = await _secureStorage.getValue(
        StorageKeys.swapTxSensitive + '_' + swapTx.id,
      );
      if (err != null) throw err;

      final swapSensitive = SwapTxSensitive.fromJson(
        jsonDecode(swapSentive!) as Map<String, dynamic>,
      );

      if (isLiquid) {
        final swapFees = await fees?.submarine();
        final refundFeesEstimate = swapFees?.lbtcFees.minerFees;
        // final refundFeesEstimate = fees?.lbtcSubmarine.claimFees;
        if (refundFeesEstimate == null) throw 'Fees estimate not found';

        final swap = swapTx.toLbtcLnSwap(swapSensitive);
        // waiting on PR to add cooperative refund
        // final resp = await swap.refund(
        //   outAddress: address,
        //   absFee: refundFeesEstimate,
        //   tryCooperate: tryCooperate,
        // );

        // return (resp, null);

        final signedHex = await swap.refund(
          outAddress: address,
          absFee: refundFeesEstimate,
          tryCooperate: tryCooperate,
        );
        // locator<Logger>()
        //     .log('------${swapTx.id}-----\n$signedHex------signed-refund-----');
        final (blockchain, err) = _networkRepository.liquidUrl;
        if (err != null) throw err;
        if (broadcastViaBoltz) {
          final txid = await swap.broadcastBoltz(
            signedHex: signedHex,
          );
          return (txid, null);
        } else {
          try {
            final txid = await lwk.Wallet.broadcastTx(
              electrumUrl: blockchain!,
              txBytes: Uint8List.fromList(hex.decode(signedHex)),
            );
            return (txid, null);
          } catch (e) {
            print('Failed to broadcast transaction: $e');
            await Future.delayed(
              const Duration(
                seconds: 5,
              ),
            ); // this non-blocking delay is to accomodate mempool propogation if the first try failed.
            final txid = await lwk.Wallet.broadcastTx(
              electrumUrl: blockchain!,
              txBytes: Uint8List.fromList(hex.decode(signedHex)),
            );
            return (txid, null);
          }
        }
      } else {
        final swapFees = await fees?.submarine();
        final refundFeesEstimate = swapFees?.btcFees.minerFees;
        // final refundFeesEstimate = fees?.btcSubmarine.claimFees;
        if (refundFeesEstimate == null) throw 'Fees estimate not found';

        final swap = swapTx.toBtcLnSwap(swapSensitive);

        final resp = await swap.refund(
          outAddress: address,
          absFee: refundFeesEstimate,
          tryCooperate: tryCooperate,
        );

        return (resp, null);
      }
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }

  Future<Err?> cooperativeSubmarineClose({
    required SwapTx swapTx,
    required Wallet wallet,
  }) async {
    try {
      final isLiquid = wallet.baseWalletType == BaseWalletType.Liquid;

      final (swapSentive, err) = await _secureStorage.getValue(
        StorageKeys.swapTxSensitive + '_' + swapTx.id,
      );
      if (err != null) throw err;

      final swapSensitive = SwapTxSensitive.fromJson(
        jsonDecode(swapSentive!) as Map<String, dynamic>,
      );

      if (isLiquid) {
        final swap = swapTx.toLbtcLnSwap(swapSensitive);
        await swap.coopCloseSubmarine();
        return null;
      } else {
        final swap = swapTx.toBtcLnSwap(swapSensitive);
        await swap.coopCloseSubmarine();
        return null;
      }
    } catch (e) {
      return Err(e.toString());
    }
  }
}

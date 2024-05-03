import 'dart:convert';

import 'package:bb_arch/_pkg/tx/models/bitcoin_tx.dart';
import 'package:bb_arch/_pkg/tx/models/liquid_tx.dart';
import 'package:bb_arch/_pkg/wallet/models/bitcoin_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/liquid_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:isar/isar.dart';

part 'tx.g.dart';

@Collection(ignore: {'copyWith'})
class Tx {
  Id isarId = Isar.autoIncrement;

  @Index()
  String id = '';

  @Enumerated(EnumType.ordinal)
  TxType type = TxType.Bitcoin;

  @Index()
  int timestamp = 0;

  int amount = 0;
  int fee = 0;

  int? height;

  String? psbt;
  int? broadcastTime;
  bool? rbfEnabled;

  int? version;
  int? vsize;
  int? weight;
  int? locktime;

  // TODO: Ideally shouldn't have both BitcoinTxIn and LiquidTxIn
  List<BitcoinTxIn>? inputs;
  List<BitcoinTxOut>? outputs;

  List<LiquidTxIn>? linputs;
  List<LiquidTxOut>? loutputs;

  String? toAddress;

  @Index(type: IndexType.value, caseSensitive: false)
  List<String>? labels;

  @Index()
  String? walletId;

  // TODO: Manually doing this sucks
  // This is done, because Tx is not @freezed at base class level.
  // To be experimented
  Map<String, dynamic> toJson() {
    if (this is BitcoinTx) {
      return (this as BitcoinTx).toJson();
    } else if (this is LiquidTx) {
      return (this as LiquidTx).toJson();
    }

    return {
      'isarId': isarId,
      'id': id,
      'type': type.name,
      'timestamp': timestamp,
      'amount': amount,
      'fee': fee,
      'height': height,
      'psbt': psbt,
      'broadcastTime': broadcastTime,
      'rbfEnabled': rbfEnabled,
      'version': version,
      'vsize': vsize,
      'weight': weight,
      'locktime': locktime,
      'inputs': inputs?.map((e) {
        // TODO: Better way to do this?
        // Without this decode / encode gimmick, e.toJson() returns Map<String, dynamic>,
        // where `previousOutput` is of type BitcoinOutPoint rather than Map<String, dynamic>
        // print('input');
        // print(e.toJson());
        // print(jsonEncode(e.toJson()));
        return jsonDecode(jsonEncode(e.toJson()));
      }).toList(),
      'outputs': outputs?.map((e) => e.toJson()).toList(),
      'linputs': linputs?.map((e) {
        return jsonDecode(jsonEncode(e.toJson()));
      }).toList(),
      'loutputs': loutputs?.map((e) {
        return jsonDecode(jsonEncode(e.toJson()));
      }).toList(),
      'toAddress': toAddress,
      'labels': labels,
      'walletId': walletId,
    };
  }

  static Tx fromJson(Map<String, dynamic> json) {
    if (json.containsKey('type') && json['type'] == TxType.Bitcoin.name) {
      return BitcoinTx.fromJson(json);
    } else if (json.containsKey('type') && json['type'] == TxType.Liquid.name) {
      return LiquidTx.fromJson(json);
    }
    throw UnimplementedError('Unsupported Tx subclass');
  }

  static Future<Tx> loadFromNative(dynamic tx, Wallet w) async {
    if (w.type == WalletType.Bitcoin) {
      return BitcoinTx.loadFromNative(tx, w as BitcoinWallet);
    } else if (w.type == WalletType.Liquid) {
      return LiquidTx.loadFromNative(tx, w as LiquidWallet);
    }
    throw UnimplementedError('Unsupported Tx subclass');
  }
}

enum TxType { Bitcoin, Liquid, Lightning, Usdt }

extension TxTypeExtension on TxType {
  String get name {
    switch (this) {
      case TxType.Bitcoin:
        return 'Bitcoin';
      case TxType.Liquid:
        return 'Liquid';
      case TxType.Lightning:
        return 'Lightning';
      case TxType.Usdt:
        return 'Usdt';
    }
  }
}

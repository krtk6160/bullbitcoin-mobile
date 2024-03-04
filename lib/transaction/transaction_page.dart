import 'package:bb_mobile/_model/address.dart';
import 'package:bb_mobile/_model/transaction.dart';
import 'package:bb_mobile/_pkg/launcher.dart';
import 'package:bb_mobile/_pkg/mempool_api.dart';
import 'package:bb_mobile/_pkg/storage/hive.dart';
import 'package:bb_mobile/_pkg/storage/secure_storage.dart';
import 'package:bb_mobile/_pkg/wallet/address.dart';
import 'package:bb_mobile/_pkg/wallet/create.dart';
import 'package:bb_mobile/_pkg/wallet/repository.dart';
import 'package:bb_mobile/_pkg/wallet/sensitive/create.dart';
import 'package:bb_mobile/_pkg/wallet/sensitive/repository.dart';
import 'package:bb_mobile/_pkg/wallet/sensitive/transaction.dart';
import 'package:bb_mobile/_pkg/wallet/sync.dart';
import 'package:bb_mobile/_pkg/wallet/transaction.dart';
import 'package:bb_mobile/_pkg/wallet/update.dart';
import 'package:bb_mobile/_ui/app_bar.dart';
import 'package:bb_mobile/_ui/bottom_sheet.dart';
import 'package:bb_mobile/_ui/components/button.dart';
import 'package:bb_mobile/_ui/components/text.dart';
import 'package:bb_mobile/_ui/headers.dart';
import 'package:bb_mobile/_ui/label_field.dart';
import 'package:bb_mobile/_ui/toast.dart';
import 'package:bb_mobile/currency/bloc/currency_cubit.dart';
import 'package:bb_mobile/home/bloc/home_cubit.dart';
import 'package:bb_mobile/locator.dart';
import 'package:bb_mobile/network/bloc/network_cubit.dart';
import 'package:bb_mobile/network_fees/bloc/network_fees_cubit.dart';
import 'package:bb_mobile/network_fees/popup.dart';
import 'package:bb_mobile/settings/bloc/settings_cubit.dart';
import 'package:bb_mobile/swap/bloc/swap_bloc.dart';
import 'package:bb_mobile/swap/tx_page.dart';
import 'package:bb_mobile/transaction/bloc/state.dart';
import 'package:bb_mobile/transaction/bloc/transaction_cubit.dart';
import 'package:bb_mobile/wallet/bloc/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

class TxPage extends StatelessWidget {
  const TxPage({super.key, required this.tx});

  final Transaction tx;

  @override
  Widget build(BuildContext context) {
    final home = locator<HomeCubit>();
    final wallet = home.state.selectedWalletCubit!;
    final networkFees = NetworkFeesCubit(
      hiveStorage: locator<HiveStorage>(),
      mempoolAPI: locator<MempoolAPI>(),
      networkCubit: locator<NetworkCubit>(),
      defaultNetworkFeesCubit: context.read<NetworkFeesCubit>(),
    );

    final txCubit = TransactionCubit(
      tx: tx,
      walletBloc: wallet,
      mempoolAPI: locator<MempoolAPI>(),
      walletUpdate: locator<WalletUpdate>(),
      walletCreate: locator<WalletCreate>(),
      walletSensCreate: locator<WalletSensitiveCreate>(),
      hiveStorage: locator<HiveStorage>(),
      secureStorage: locator<SecureStorage>(),
      walletSync: locator<WalletSync>(),
      walletTx: locator<WalletTx>(),
      walletSensTx: locator<WalletSensitiveTx>(),
      walletRepository: locator<WalletRepository>(),
      walletSensRepository: locator<WalletSensitiveRepository>(),
      walletAddress: locator<WalletAddress>(),
      settingsCubit: locator<SettingsCubit>(),
      networkCubit: locator<NetworkCubit>(),
      networkFeesCubit: networkFees,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: txCubit),
        BlocProvider.value(value: wallet),
        BlocProvider.value(value: networkFees),
        BlocProvider.value(value: locator<SwapBloc>()),
      ],
      child: BlocListener<TransactionCubit, TransactionState>(
        listenWhen: (previous, current) => previous.tx != current.tx,
        listener: (context, state) async {
          home.updateSelectedWallet(wallet);
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: const TxAppBar(),
          ),
          body: const _Screen(),
        ),
      ),
    );
  }
}

class TxAppBar extends StatelessWidget {
  const TxAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final tx = context.select((TransactionCubit cubit) => cubit.state.tx);
    final w = context.select((TransactionCubit cubit) => cubit.walletBloc.state.wallet!);
    final (labels, isInherited) = tx.getLabels(w);

    return BBAppBar(
      text: labels.isNotEmpty ? labels.join(', ') : 'Transaction',
      onBack: () {
        context.pop();
      },
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    final tx = context.select((TransactionCubit cubit) => cubit.state.tx);
    final w = context.select((WalletBloc cubit) => cubit.state.wallet!);

    final isSwap = tx.swapTx != null;
    if (isSwap) return const SwapTxPage();

    // final toAddresses = tx.outAddresses ?? [];

    final err = context.select((TransactionCubit cubit) => cubit.state.errLoadingAddresses);

    final txid = tx.txid;
    final amt = tx.getAmount().abs();
    final isReceived = tx.isReceived();
    final fees = tx.fee ?? 0;
    final amtStr = context.select(
      (CurrencyCubit cubit) => cubit.state.getAmountInUnits(amt, removeText: true),
    );
    final feeStr = context.select(
      (CurrencyCubit cubit) => cubit.state.getAmountInUnits(fees, removeText: true),
    );
    final units = context.select(
      (CurrencyCubit cubit) => cubit.state.getUnitString(),
    );
    final status = tx.timestamp == 0 ? 'Pending' : 'Confirmed';
    final time = tx.timestamp == 0 ? 'Waiting for confirmations' : timeago.format(tx.getDateTime());
    final broadcastTime = tx.getBroadcastDateTime();

    final recipients = tx.outAddrs;
    final recipientAddress = isReceived
        ? tx.outAddrs.firstWhere(
            (element) => element.kind == AddressKind.deposit,
            orElse: () => Address(
              address: '',
              kind: AddressKind.deposit,
              state: AddressStatus.used,
            ),
          )
        : tx.outAddrs.firstWhere(
            (element) => element.kind == AddressKind.external,
            orElse: () => Address(
              address: '',
              kind: AddressKind.external,
              state: AddressStatus.used,
            ),
          );

    final (labels, labelsInherited) = tx.getLabels(w);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Gap(24),
              const BumpFeesButton(),
              BBText.title(
                isReceived ? 'Amount received' : 'Amount sent',
              ),
              const Gap(4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Container(
                    transformAlignment: Alignment.center,
                    transform: Matrix4.identity()..rotateZ(isReceived ? 1 : -1),
                    child: const FaIcon(
                      FontAwesomeIcons.arrowRight,
                      size: 12,
                    ),
                  ),
                  const Gap(8),
                  BBText.titleLarge(
                    amtStr,
                    isBold: true,
                  ),
                  const Gap(4),
                  BBText.title(
                    units,
                    isBold: true,
                  ),
                ],
              ),
              const Gap(24),
              const BBText.title('Transaction ID'),
              const Gap(4),
              InkWell(
                onTap: () {
                  final url = context.read<NetworkCubit>().state.explorerTxUrl(txid);
                  locator<Launcher>().launchApp(url);
                },
                child: BBText.body(txid, isBlue: true),
              ),
              const Gap(24),
              if (recipients.isNotEmpty && recipientAddress.address.isNotEmpty) ...[
                const BBText.title('Recipient Bitcoin Address'),
                // const Gap(4),
                InkWell(
                  onTap: () {
                    final url = context
                        .read<NetworkCubit>()
                        .state
                        .explorerAddressUrl(recipientAddress.address);
                    locator<Launcher>().launchApp(url);
                  },
                  child: BBText.body(recipientAddress.address, isBlue: true),
                ),

                const Gap(24),
              ],
              const BBText.title(
                'Status',
              ),
              const Gap(4),
              BBText.titleLarge(
                status,
                isBold: true,
              ),
              const Gap(24),
              const BBText.title(
                'Network Fee',
              ),
              const Gap(4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  BBText.titleLarge(
                    feeStr,
                    isBold: true,
                  ),
                  const Gap(4),
                  BBText.title(
                    units,
                    isBold: true,
                  ),
                ],
              ),
              const Gap(24),
              BBText.title(
                isReceived ? 'Tranaction received' : 'Transaction sent',
              ),
              const Gap(4),
              BBText.titleLarge(
                time,
                isBold: true,
              ),
              if (broadcastTime != null) ...[
                const Gap(24),
                const BBText.title(
                  'Sent Time',
                ),
                BBText.titleLarge(
                  timeago.format(broadcastTime),
                  isBold: true,
                ),
              ],
              const Gap(24),
              const BBText.title(
                'Change Label',
              ),
              const Gap(4),
              TxLabelTextField(labels: labels),
              const Gap(24),
              if (err.isNotEmpty) ...[
                const Gap(32),
                BBText.errorSmall(
                  err,
                ),
              ],
              const Gap(100),
            ],
          ),
        ),
      ),
    );
  }
}

class TxLabelTextField extends StatefulWidget {
  TxLabelTextField({super.key, required this.labels});

  List<String> labels;

  @override
  State<TxLabelTextField> createState() => _TxLabelTextFieldState();
}

class _TxLabelTextFieldState extends State<TxLabelTextField> {
  late List<String> _labels;

  @override
  void initState() {
    _labels = widget.labels;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final storedLabel = context.select((TransactionCubit x) => x.state.tx.label ?? '');
    final showButton = context.select(
      (TransactionCubit x) => x.state.showSaveButton(),
      // && storedLabel.isEmpty,
    );
    final label = context.select((TransactionCubit x) => x.state.label);
    final suggestions =
        context.select((TransactionCubit x) => x.walletBloc.state.wallet?.globalLabels ?? []);

    return Row(
      children: [
        Expanded(
          child: LabelField(
            suggestions: suggestions,
            labels: _labels,
            onChanged: (List<String> lbls) {
              setState(() {
                _labels = lbls;
              });
            },
          ),
        ),
        const Gap(8),
        BBButton.smallRed(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(context.showToast('Labels saved'));
            context.read<TransactionCubit>().saveLabelsClicked(_labels);
          },
          label: 'SAVE',
        ),
      ],
    );
  }
}

class BumpFeesButton extends StatelessWidget {
  const BumpFeesButton({super.key});

  @override
  Widget build(BuildContext context) {
    final canRbf = context.select((TransactionCubit x) => x.state.tx.canRBF());
    final isReceive = context.select((TransactionCubit x) => x.state.tx.isReceived());
    if (!canRbf) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!isReceive)
          BBButton.bigRed(
            label: 'Bump Fees',
            onPressed: () async {
              await BumpFeesPopup.showPopUp(context);
            },
          ),
        const Gap(24),
      ],
    );
  }
}

class BumpFeesPopup extends StatelessWidget {
  const BumpFeesPopup({super.key});

  static Future showPopUp(BuildContext context) async {
    final tx = context.read<TransactionCubit>();
    final wallet = context.read<WalletBloc>();
    final networkFees = context.read<NetworkFeesCubit>();

    return showBBBottomSheet(
      context: context,
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: wallet),
          BlocProvider.value(value: tx),
          BlocProvider.value(value: networkFees),
        ],
        child: BlocListener<TransactionCubit, TransactionState>(
          listenWhen: (previous, current) => previous.sentTx != current.sentTx,
          listener: (context, state) async {
            if (state.sentTx) {
              await Future.delayed(2.seconds);
              context
                ..pop()
                ..pop();
            }
          },
          child: const BumpFeesPopup(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final amt = context.select((TransactionCubit x) => x.state.feeRate?.toString() ?? '');
    // final built = context.select((TransactionCubit x) => x.state.updatedTx != null);
    final sent = context.select((TransactionCubit x) => x.state.sentTx);
    final sending = context.select((TransactionCubit x) => x.state.sendingTx);
    final building = context.select((TransactionCubit x) => x.state.buildingTx);
    final loading = building || sending;

    final er = context.select((TransactionCubit x) => x.state.errSendingTx);
    final err = context.select((TransactionCubit x) => x.state.errBuildingTx);

    final errr = err.isNotEmpty ? err : er;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (sent) ...[
            const BBHeader.popUpCenteredText(isLeft: true, text: 'Bump Fees'),
            const Gap(32),
            const Center(
              child: FaIcon(
                FontAwesomeIcons.circleCheck,
                size: 64,
                color: Colors.green,
              ),
            ).animate(delay: 100.ms).scale().fadeIn(),
            const Center(child: BBText.title('Fees Bumped Successfully')).animate().fadeIn(),
            const Gap(32),
            const Center(child: BBText.bodySmall('You will be redirected in 2 seconds')),
          ] else ...[
            BBHeader.popUpCenteredText(
              isLeft: true,
              text: 'Bump Fees',
              onBack: () {
                context.pop();
              },
            ),
            // const Gap(32),
            // const BBText.title('Enter Fees'),
            // const Gap(4),
            const FeesSelectionOptions(),
            // BBAmountInput(
            //   hint: 'update sats/vb',
            //   disabled: false,
            //   btcFormatting: false,
            //   isSats: true,
            //   onChanged: (e) {
            //     context.read<TransactionCubit>().updateFeeRate(e);
            //   },
            //   value: amt,
            // ),
            // const Gap(32),
            if (errr.isNotEmpty) BBText.errorSmall(errr),
            const Gap(8),
            BBButton.bigRed(
              label: 'Bump Fees',
              // label: built ? 'Send Transaction' : 'Build Transaction',
              loading: loading,
              disabled: loading || sent,
              onPressed: () {
                // if (!built)
                context.read<TransactionCubit>().buildTx();
                // else
                //   context.read<TransactionCubit>().sendTx();
              },
            ),
          ],
          const Gap(80),
        ],
      ),
    );
  }
}

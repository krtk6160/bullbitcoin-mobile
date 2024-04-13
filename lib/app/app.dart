import 'package:bb_arch/_pkg/address/address_repository.dart';
import 'package:bb_arch/_pkg/seed/seed_repository.dart';
import 'package:bb_arch/_pkg/storage/hive.dart';
import 'package:bb_arch/_pkg/storage/secure_storage.dart';
import 'package:bb_arch/_pkg/tx/tx_repository.dart';
import 'package:bb_arch/_pkg/wallet/wallet_repository.dart';
import 'package:bb_arch/address/bloc/addr_bloc.dart';
import 'package:bb_arch/router.dart';
import 'package:bb_arch/tx/bloc/tx_bloc.dart';
import 'package:bb_arch/wallet/bloc/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App(
      {super.key,
      required this.storage,
      required this.secureStorage,
      required this.seedRepository,
      required this.walletRepository,
      required this.txRepository,
      required this.addressRepository});

  final HiveStorage storage;
  final SecureStorage secureStorage;
  final SeedRepository seedRepository;
  final WalletRepository walletRepository;
  final TxRepository txRepository;
  final AddressRepository addressRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: seedRepository),
        RepositoryProvider.value(value: walletRepository),
        RepositoryProvider.value(value: txRepository),
        RepositoryProvider.value(value: addressRepository)
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(
            create: (_) => WalletBloc(walletRepository: walletRepository, seedRepository: seedRepository)
              ..add(LoadAllWallets())
              ..add(SyncAllWallets())),
        BlocProvider(create: (_) => TxBloc(txRepository: txRepository)),
        BlocProvider(create: (_) => AddressBloc(addrRepository: addressRepository)),
      ], child: const AppView()),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BB Arch - PoC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

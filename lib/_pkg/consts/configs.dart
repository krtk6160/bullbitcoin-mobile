import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lwk_dart/lwk_dart.dart' as lwk;

void setupConfigs() {}

final bbmempoolapi = dotenv.env['BB_MEMPOOL_API'] ?? 'mempool.bullbitcoin.com';
final openmempoolapi = dotenv.env['MEMPOOL_API'] ?? 'mempool.space';
final bbexchangeapi = dotenv.env['BB_API'] ?? 'api.bullbitcoin.com/price';
// final bbexchangeapi = dotenv.env['BB_API'] ?? 'pricer.bullbitcoin.dev/api';

const bbelectrum = 'wes.bullbitcoin.com';
const openelectrum = 'electrum.blockstream.info';

const liquidElectrumUrl = 'blockstream.info:995';
const liquidElectrumTestUrl = 'blockstream.info:465';
const bbLiquidElectrumUrl = 'les.bullbitcoin.com:995';
const bbLiquidElectrumTestUrl = 'blockstream.info:465';

// const boltzTestnet = 'api.testnet.boltz.exchange';
// const boltzMainnet = 'api.boltz.exchange';

const boltzTestnet = 'api.testnet.boltz.exchange/v2';
const boltzMainnet = 'api.boltz.exchange/v2';

final exchangeapi = bbexchangeapi;
final mempoolapi = openmempoolapi; //bbmempoolapi;

const liquidMempool = 'https://liquid.network';
const liquidMempoolTestnet = 'https://liquid.network/testnet';

const liquidMainnetAssetId = lwk.lBtcAssetId;
const liquidTestnetAssetId = lwk.lTestAssetId;

import 'package:bb_mobile/_pkg/migrations/migration0_1to0_2.dart';
import 'package:bb_mobile/_pkg/migrations/migration0_2_2to0_2_3.dart';
import 'package:bb_mobile/_pkg/migrations/migration0_2to0_3.dart';
import 'package:bb_mobile/_pkg/storage/hive.dart';
import 'package:bb_mobile/_pkg/storage/secure_storage.dart';

Future<void> doMigration(
  String fromVersion,
  String toVersion,
  SecureStorage secureStorage,
  HiveStorage hiveStorage,
) async {
  print('fromVersion $fromVersion; toVersion $toVersion');

  final fromPatch = int.tryParse(fromVersion.split('.').last)!;
  final toPatch = int.tryParse(toVersion.split('.').last)!;

  if (toVersion.startsWith('0.2')) {
    if (fromVersion.startsWith('0.1')) {
      await doMigration0_1to0_2(secureStorage, hiveStorage);
      if (toPatch >= 3) {
        await doMigrationPatch0_2_2to0_2_3(secureStorage, hiveStorage);
      }
    } else if (fromVersion.startsWith('0.2')) {
      if (fromPatch <= 2 && toPatch >= 3) {
        await doMigrationPatch0_2_2to0_2_3(secureStorage, hiveStorage);
      }
    }
  } else if (toVersion.startsWith('0.3')) {
    if (fromVersion.startsWith('0.1')) {
      await doMigration0_1to0_2(secureStorage, hiveStorage);
      await doMigrationPatch0_2_2to0_2_3(secureStorage, hiveStorage);
      await doMigration0_2to0_3(secureStorage, hiveStorage);
    } else if (fromVersion.startsWith('0.2')) {
      if (fromPatch <= 2) {
        await doMigrationPatch0_2_2to0_2_3(secureStorage, hiveStorage);
      }
      await doMigration0_2to0_3(secureStorage, hiveStorage);
    }
  } else if (toVersion.startsWith('0.4')) {
    if (fromVersion.startsWith('0.1')) {
      await doMigration0_1to0_2(secureStorage, hiveStorage);
      await doMigration0_2to0_3(secureStorage, hiveStorage);
      await doMigration0_3to0_4(secureStorage, hiveStorage);
    } else if (fromVersion.startsWith('0.2')) {
      await doMigration0_2to0_3(secureStorage, hiveStorage);
      await doMigration0_3to0_4(secureStorage, hiveStorage);
    } else if (fromVersion.startsWith('0.3')) {
      await doMigration0_3to0_4(secureStorage, hiveStorage);
    }
  }
}

Future<void> doMigration0_3to0_4(
  SecureStorage secureStorage,
  HiveStorage hiveStorage,
) async {
  print('Migration: 0.3 to 0.4');
}

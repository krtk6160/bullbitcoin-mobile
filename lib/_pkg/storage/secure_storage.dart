import 'package:bb_arch/_pkg/err.dart';
import 'package:bb_arch/_pkg/storage/storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage implements IStorage {
  final storage = const FlutterSecureStorage();

  @override
  Future<Err?> saveValue({
    required String key,
    required String value,
  }) async {
    try {
      await storage.write(
        key: key,
        value: value,
      );
      return null;
    } catch (e) {
      return Err(e.toString());
    }
  }

  @override
  Future<(Map<String, String>?, Err?)> getAll() async {
    try {
      final value = await storage.readAll();
      return (value, null);
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }

  @override
  Future<(String?, Err?)> getValue(
    String key,
  ) async {
    try {
      final value = await storage.read(
        key: key,
      );

      if (value == null) throw 'No Key';

      return (value, null);
    } catch (e) {
      return (null, Err(e.toString(), expected: e == 'No Key'));
    }
  }

  @override
  Future<Err?> deleteValue(
    String key,
  ) async {
    try {
      final _ = await storage.delete(
        key: key,
      );

      return null;
    } catch (e) {
      return Err(e.toString());
    }
  }

  @override
  Future<Err?> deleteAll() async {
    try {
      await storage.deleteAll();

      return null;
    } catch (e) {
      return Err(e.toString());
    }
  }
}

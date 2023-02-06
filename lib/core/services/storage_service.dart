import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  Future<StorageService> init() async {
    await GetStorage.init();
    return this;
  }

  Future post(String key, dynamic value) async {
    final GetStorage _storage = GetStorage();
    await _storage.write(key, value);
  }

  getValue(String key) {
    try {
      final GetStorage _storage = GetStorage();
      return _storage.read(key);
    } catch (e) {
      rethrow;
    }
  }

  deleteValue(String key) {
    try {
      final GetStorage _storage = GetStorage();
      return _storage.remove(key);
    } catch (e) {
      rethrow;
    }
  }
}

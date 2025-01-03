import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'secure_storage_repository.g.dart';

abstract interface class SecureStorageInterface {
  Future<void> writeData(String value);
  Future<T?> readData<T>();
  Future<void> deleteData();
}

// SecureStorageRepository untuk penggunaan general disini digunakan untuk menyimpan berbagai value
class SecureStorageRepository {
  late final FlutterSecureStorage storage;

  SecureStorageRepository() {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  Future<void> writeData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> readData(String key) async {
    return await storage.read(key: key);
  }

  Future<void> deleteData(String key) async {
    await storage.delete(key: key);
  }

  AndroidOptions _getAndroidOptions() => AndroidOptions(
        encryptedSharedPreferences: true,
      );
}

@riverpod
SecureStorageRepository secureStorageRepository(Ref ref) {
  return SecureStorageRepository();
}

@riverpod
class PbAuthTokenSecureStorageRepository
    extends _$PbAuthTokenSecureStorageRepository
    implements SecureStorageInterface {
  @override
  void build() {
    //"ref" by default is accessible in notifier class
    // sama seperti state
  }

  final String _key = "PB_AUTH_TOKEN_SECURE_STORAGE_KEY";

  @override
  Future<void> writeData(String value) async {
    return await ref
        .read(secureStorageRepositoryProvider)
        .writeData(_key, value);
  }

  @override
  Future<T?> readData<T>() async {
    return await ref.read(secureStorageRepositoryProvider).readData(_key) as T;
  }

  @override
  Future<void> deleteData() async {
    return await ref.read(secureStorageRepositoryProvider).deleteData(_key);
  }
}

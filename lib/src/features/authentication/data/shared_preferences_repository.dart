import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'shared_preferences_repository.g.dart';

abstract interface class SharedPreferenceStorageInterface {
  Future<void> writeData(String value);
  T? readData<T>();
  Future<void> deleteData();
}

@riverpod
class SharedPreferencesRepository extends _$SharedPreferencesRepository {
  // arguments Notifier bisa kita letakan pada parameter build method, jumlahnya terserah
  @override
  void build(String key) async {
    this.key; // tidak perlu declare variabel key lagi, bisa langsung di akses menggunakan this.key
    prefs = await SharedPreferences.getInstance();
  }

  late final SharedPreferences prefs;

  Future<void> writeData<T>(
    T value,
    Future<void> Function(String key, T value) callback,
  ) async {
    await callback(key, value);
  }

  T? readData<T>(
    T Function(String key) callback,
  ) {
    return callback(key);
  }

  Future<void> deleteData(String key) async {
    await prefs.remove(key);
  }
}

@riverpod
class OtpIdSharedPrefRepository extends _$OtpIdSharedPrefRepository
    implements SharedPreferenceStorageInterface {
  late final SharedPreferencesRepository _prefsRepository;
  @override
  void build() async {
    _prefsRepository =
        await ref.watch(sharedPreferencesRepositoryProvider(_key).notifier);
  }

  final String _key = "OTP_ID_SHARED_PREFERENCES_KEY";

  @override
  Future<void> writeData(String value) async {
    await _prefsRepository.writeData<String>(value,
        (String key, String value) async {
      await _prefsRepository.prefs.setString(key, value);
    });
  }

  @override
  T? readData<T>() {
    return _prefsRepository.readData((String key) {
      return _prefsRepository.prefs.getString(key) as T;
    });
  }

  @override
  Future<void> deleteData() async {
    _prefsRepository.deleteData(_key);
  }
}

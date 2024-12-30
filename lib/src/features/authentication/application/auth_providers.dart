import 'package:justdoit/src/exceptions/custom_exception.dart';
import 'package:justdoit/src/features/authentication/data/secure_storage_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_providers.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  Future<String?> build() async {
    return await _fetch();
  }

  Future<String?> refresh() async {
    // kita buat terpisah dari _readAuth karna disana state akan sempat masuk state loading, jika kita menggunakan method yang statenya smpat menjadi loading maka kita perlu sebuah pengkondisian ditempat penggunaanya. pengkondisian saat masih loading dan saat sudah ada data. jika tidak ada, dan kita langsung cek apakah nilainya tidak null maka nilai pertama yang dikembalikan pasti null karna masih dalam tahap loading, barulah nilai kedua ada. pada splash screeen hal ini menyebabkan splash screen mempush page ke halaman login saat state dalam keadaan loading lalu mempush kembali ke halaman markdown list saat data sudah diterima, hal ini tentu sangat buruk dalam jika dilihat oleh user
    try {
      final token = await ref
          .read(pbAuthTokenSecureStorageRepositoryProvider.notifier)
          .readData();
      state = AsyncValue.data(token);
      return state.value;
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "4512dc40", details: e);
    }
  }

  Future<String?> _fetch() async {
    state = const AsyncValue.loading();
    final result = await AsyncValue.guard(() async {
      return await ref
          .read(pbAuthTokenSecureStorageRepositoryProvider.notifier)
          .readData();
    });
    state = AsyncValue.data(result.value);
    return state.value;
  }
}

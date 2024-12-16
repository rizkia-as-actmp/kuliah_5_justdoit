import 'package:justdoit/src/features/authentication/data/auth_repository.dart';
import 'package:justdoit/src/features/authentication/data/shared_preferences_repository.dart';
import 'package:justdoit/src/exceptions/custom_exception.dart';
import 'package:justdoit/src/features/authentication/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_service.g.dart';

@riverpod
class AuthService extends _$AuthService {
  @override
  void build() {}

  Future<User> registerUser(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final user = await ref
          .read(authRepositoryProvider)
          .registerUser(name, email, password);

      return user;
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "ded49291", details: e);
    }
  }

  Future<bool> authWithPassword({
    required String email,
    required String password,
  }) async {
    try {
      final auth = await ref
          .read(authRepositoryProvider)
          .authWithPassword(email, password);
      await ref
          .read(otpIdSharedPrefRepositoryProvider.notifier)
          .writeData(auth.otpId!);
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "c432149f", details: e);
    }

    return true;
  }

  Future<bool> verifyOtp({
    required String otp,
  }) async {
    try {
      final otpId =
          ref.read(otpIdSharedPrefRepositoryProvider.notifier).readData();
      final auth = await ref.read(authRepositoryProvider).verifyOtp(otpId, otp);
      //await ref .watch(otpIdSharedPrefRepositoryProvider.notifier) .writeData(auth.otpId!);
      //print(await ref .watch(otpIdSharedPrefRepositoryProvider.notifier) .readData());
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "f6ad0590", details: e);
    }

    return true;
  }
}

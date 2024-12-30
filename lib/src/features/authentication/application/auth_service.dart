import 'package:justdoit/src/features/authentication/application/auth_providers.dart';
import 'package:justdoit/src/features/authentication/data/auth_repository.dart';
import 'package:justdoit/src/features/authentication/data/secure_storage_repository.dart';
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

  Future<void> requestVerification({required String email}) async {
    try {
      await ref.read(authRepositoryProvider).requestVerification(email);
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "fa96736c", details: e);
    }
  }

  Future<String> requestPasswordReset({required String email}) async {
    try {
      final token =
          await ref.read(authRepositoryProvider).requestPasswordReset(email);
      return token;
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "39d0fb16", details: e);
    }
  }

  Future<bool> confirmPasswordReset({
    required String token,
    required String oldPassword,
    required String newPassword,
    required String newPasswordConfirm,
  }) async {
    try {
      await ref.read(authRepositoryProvider).confirmPasswordReset(
          token, oldPassword, newPassword, newPasswordConfirm);
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "fae3aa4f", details: e);
    }
    return true;
  }

  Future<bool> verifyOtp({
    required String otp,
  }) async {
    try {
      final otpId =
          ref.read(otpIdSharedPrefRepositoryProvider.notifier).readData();
      final authToken =
          await ref.read(authRepositoryProvider).verifyOtp(otpId, otp);
      await ref
          .read(pbAuthTokenSecureStorageRepositoryProvider.notifier)
          .writeData(authToken);
      await ref.read(authProvider.notifier).refresh();
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "f6ad0590", details: e);
    }

    return true;
  }
}

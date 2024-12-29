import 'package:justdoit/src/features/authentication/application/auth_service.dart';
import 'package:justdoit/src/exceptions/custom_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_password_controller.g.dart';

@riverpod
class ChangePasswordController extends _$ChangePasswordController {
  @override
  FutureOr<void> build() {}

  Future<bool> submit({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
    required String token,
  }) async {
    try {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async {
        if (newPassword != confirmPassword) {
          throw CustomException(
              id: "08868390",
              message: 'Passwords do not match',
              details:
                  'The password you entered does not match the confirmation password.');
        }

        await Future.delayed(const Duration(seconds: 1));
        await ref.read(authServiceProvider.notifier).confirmChangePassword(
              oldPassword: oldPassword,
              newPassword: newPassword,
              confirmNewPassword: confirmPassword,
              token: token,
            );
      });

      return state.hasError == false;
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "25c870b7", details: e);
    }
  }
}

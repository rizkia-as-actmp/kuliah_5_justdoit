import 'package:justdoit/src/exceptions/custom_exception.dart';
import 'package:justdoit/src/features/authentication/application/auth_service.dart';
import 'package:justdoit/src/features/authentication/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'register_controller.g.dart';

@riverpod
class RegisterController extends _$RegisterController {
  @override
  Future<User?> build() async {
    return null;
  }

  Future<User> submit({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    try {
      state = const AsyncValue.loading();
      late User user;
      state = await AsyncValue.guard(() async {
        await Future.delayed(Duration(seconds: 1));
        if (password != passwordConfirm) {
          throw CustomException(
              id: "eee073f0",
              message: 'Passwords do not match',
              details:
                  'The password you entered does not match the confirmation password.');
        }

        user = await ref
            .read(authServiceProvider.notifier)
            .registerUser(name: name, email: email, password: password);
      });
      return user;
    } catch (e) {
      if (e is CustomException) rethrow;
      print(e);
      throw CustomException(id: "ce808fd3", details: e);
    }
  }
}

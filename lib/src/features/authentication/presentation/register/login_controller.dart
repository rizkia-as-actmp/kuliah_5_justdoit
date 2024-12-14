import 'package:justdoit/src/features/authentication/application/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_controller.g.dart';

// @riverpod
// class LoginController extends _$LoginController {
//   @override
//   FutureOr<String> build() {
//     return 'tes';
//   }
//
//   Future<void> submit({
//     required String email,
//     required String password,
//   }) async {
//     // Set the state to loading
//     state = const AsyncValue.loading();
//     state = await AsyncValue.guard(() async {
//       await Future.delayed(const Duration(seconds: 3));
//       //throw Exception();
//       return "tes";
//     });
//   }
// }

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() {}

  Future<bool> submit({
    required String email,
    required String password,
  }) async {
    // Set the state to loading
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(authServiceProvider.notifier)
          .authWithPassword(email: email, password: password);
      //throw Exception();
      //return "tes";
    });
    return state.hasError == false;
  }
}

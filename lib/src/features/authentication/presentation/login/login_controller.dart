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
    // disini tidak memakai try and catch karna ketika terjadi error pada kode yang berada pada AsyncValue.guard error tersebut akan di teruskan langsung sebagai state kepada subscriber, sehingga disini AsyncValue.guard sendiri tidak akan return error sehingga try catch tidak akan menerima apapun. kemudian kode akan tetap dilanjutkan dengan return state.hasError == false;
    // namun jika terjadi error disini diluar AsyncValue maka subscriber tidak akan menerima apapun, sehingga error tidak akan ditampilkan
    // Set the state to loading
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(
          Duration(seconds: 2)); // just for showcase some loading

      await ref
          .read(authServiceProvider.notifier)
          .authWithPassword(email: email, password: password);
    });
    return state.hasError == false;
  }
}

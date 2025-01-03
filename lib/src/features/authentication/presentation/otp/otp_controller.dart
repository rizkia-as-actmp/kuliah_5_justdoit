import 'package:justdoit/src/features/authentication/application/auth_service.dart';
import 'package:justdoit/src/exceptions/custom_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'otp_controller.g.dart';

@riverpod
class OtpController extends _$OtpController {
  @override
  FutureOr<void> build() {}

  Future<bool> submit({
    required String otpCode,
  }) async {
    try {
      // Set the state to loading
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async {
        await Future.delayed(Duration(seconds: 2));
        await ref.read(authServiceProvider.notifier).verifyOtp(otp: otpCode);
      });
      return state.hasError == false;
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "4f37ff62", details: e);
    }
  }
}

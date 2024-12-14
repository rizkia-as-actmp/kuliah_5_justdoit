import 'package:justdoit/src/features/authentication/domain/auth.dart';
import 'package:justdoit/src/interfaces/http_repository.dart';

abstract interface class HttpAuthRepository implements HttpRepository {
  Future<PbAuth> authWithPassword(String email, String password);
  Future<PbAuth> verifyOtp(String otpId, String otp);
  //Future<void> logoutUser();
  //Future<void> registerUser(String email, String password, Map<String, dynamic> additionalData);
  //Future<void> resetPassword(String email);
  //Future<void> changePassword(String oldPassword, String newPassword);
  //Future<void> refreshToken(String refreshToken);
  //Future<User> getUserProfile();
  //Future<void> updateUserProfile(Map<String, dynamic> updatedData);⇧
}

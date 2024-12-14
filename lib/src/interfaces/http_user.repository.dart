import 'package:justdoit/src/features/authentication/domain/user.dart';
import 'package:justdoit/src/interfaces/http_repository.dart';

abstract interface class HttpUserRepository implements HttpRepository {
  Future<User> loginUser(String email, String password);
  //Future<void> logoutUser();
  //Future<void> registerUser(String email, String password, Map<String, dynamic> additionalData);
  //Future<void> resetPassword(String email);
  //Future<void> changePassword(String oldPassword, String newPassword);
  //Future<void> refreshToken(String refreshToken);
  //Future<User> getUserProfile();
  //Future<void> updateUserProfile(Map<String, dynamic> updatedData);⇧
}

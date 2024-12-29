import 'package:justdoit/src/features/mark/domain/mark.dart';
import 'package:justdoit/src/features/mark/domain/marklist.dart';
import 'package:justdoit/src/interfaces/http_repository.dart';

abstract interface class HttpMarkRepository implements HttpRepository {
  // Future<User> registerUser(String name, String email, String password);
  // Future<PbAuth> authWithPassword(String email, String password);
  // Future<PbAuth> verifyOtp(String otpId, String otp);
  // Future<void> requestVerification(String email);
  Future<MarkList> getList();
  Future<Mark> getDetail(String markId);
  Future<Mark> createMark(String title, String content);
  Future<Mark> updateMark(String title, String content, String markId);
  Future<void> deleteMark(String markId);
  //Future<void> logoutUser();
  //Future<void> resetPassword(String email);
  //Future<void> changePassword(String oldPassword, String newPassword);
  //Future<void> refreshToken(String refreshToken);
  //Future<User> getUserProfile();
  //Future<void> updateUserProfile(Map<String, dynamic> updatedData);⇧
}

import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable()
class PbAuth {
  PbAuth({
    this.token,
    this.otpId,
    this.email,
    this.password,
  });

  final String? token;
  final String? otpId;
  final String? email;
  final String? password;

  factory PbAuth.fromJson(Map<String, dynamic> json) => _$PbAuthFromJson(json);

  Map<String, dynamic> toJson() => _$PbAuthToJson(this);
}

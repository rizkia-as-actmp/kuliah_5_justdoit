// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PbAuth _$PbAuthFromJson(Map<String, dynamic> json) => PbAuth(
      token: json['token'] as String?,
      otpId: json['otpId'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$PbAuthToJson(PbAuth instance) => <String, dynamic>{
      'token': instance.token,
      'otpId': instance.otpId,
      'email': instance.email,
      'password': instance.password,
    };

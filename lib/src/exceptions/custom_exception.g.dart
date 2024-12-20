// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomExceptionObject _$CustomExceptionObjectFromJson(
        Map<String, dynamic> json) =>
    CustomExceptionObject(
      userFactor: json['userFactor'] as bool,
      id: json['id'] as String,
      httpResponseCode: json['httpResponseCode'] as String?,
      message: json['message'] as String,
      details: json['details'] as Object,
    );

Map<String, dynamic> _$CustomExceptionObjectToJson(
        CustomExceptionObject instance) =>
    <String, dynamic>{
      'userFactor': instance.userFactor,
      'id': instance.id,
      'httpResponseCode': instance.httpResponseCode,
      'message': instance.message,
      'details': instance.details,
    };

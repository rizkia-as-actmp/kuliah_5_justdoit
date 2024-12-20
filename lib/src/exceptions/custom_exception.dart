import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'custom_exception.g.dart';

@JsonSerializable()
class CustomExceptionObject {
  CustomExceptionObject({
    required this.userFactor,
    required this.id,
    this.httpResponseCode,
    required this.message,
    required this.details,
  });

  final bool userFactor;
  final String id;
  String? httpResponseCode;
  final String message;
  final Object details;

  factory CustomExceptionObject.fromJson(Map<String, dynamic> json) =>
      _$CustomExceptionObjectFromJson(json);
}

class CustomException implements Exception {
  final bool userFactor;
  final String id;
  String? httpResponseCode;
  final String message;
  final Object details;
  final String environment;

  CustomException({
    this.id = 'No id provided',
    this.httpResponseCode,
    this.userFactor = false,
    this.message = 'An error occurred',
    this.details = 'No additional details',
  }) : environment = const String.fromEnvironment('ENV', defaultValue: 'dev');

  @override
  String toString() {
    if (environment == 'prod') {
      if (userFactor) {
        return 'Message: $message | Details: $details';
      } else {
        return 'Internal App error';
      }
    } else {
      final Map<String, dynamic> exceptionMap = {
        'id': id,
        'userFactor': userFactor,
        'message': message,
        'details': details,
      };

      if (httpResponseCode != null) {
        exceptionMap['httpResponseCode'] = httpResponseCode;
      }

      try {
        return jsonEncode(exceptionMap);
      } catch (_) {
        final fallbackMap = {...exceptionMap, "details": details.toString()};
        return jsonEncode(fallbackMap);
      }
    }
  }
}

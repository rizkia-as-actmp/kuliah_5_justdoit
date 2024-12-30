import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/features/authentication/domain/auth.dart';
import 'package:justdoit/src/features/authentication/domain/user.dart';
import 'package:justdoit/src/interfaces/api_uri_builder.dart';
import 'package:justdoit/src/interfaces/http_auth_repository.dart';
import 'package:justdoit/src/exceptions/custom_exception.dart';
import 'package:justdoit/src/infrastructure/pocketbase_api_uri_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_repository.g.dart';

class PocketbaseAuthRepository implements HttpAuthRepository {
  PocketbaseAuthRepository({
    required this.uriBuilder,
  });

  @override
  final ApiUriBuilder uriBuilder;

  @override
  Future<User> registerUser(String name, String email, String password) async {
    try {
      Object data = {
        'name': name.toString(),
        'email': email.toString(),
        'emailVisibility': true.toString(),
        'password': password.toString(),
        'passwordConfirm': password.toString(),
      };

      return await sendRequest<User>(
        uri: uriBuilder.api("collections/users/records"),
        method: "POST",
        body: data,
        builder: (responseData) => User.fromJson(responseData),
      );
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "08892ec8", details: e);
    }
  }

  @override
  Future<PbAuth> authWithPassword(String email, String password) async {
    try {
      Object data = {
        'identity': email,
        'password': password,
      };
      return await sendRequest<PbAuth>(
        uri: uriBuilder.api("collections/users/auth-with-password"),
        method: "POST",
        body: data,
        builder: (responseData) => PbAuth.fromJson(responseData),
      );
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "74fa7563", details: e);
    }
  }

  @override
  Future<String> requestPasswordReset(String email) async {
    try {
      Object data = {
        'email': email,
      };
      return await sendRequest<String>(
        uri: uriBuilder.api("collections/users/request-password-reset"),
        method: "POST",
        body: data,
        builder: (responseData) => responseData["token"],
      );
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "c4bb1522", details: e);
    }
  }

  @override
  Future<void> requestVerification(String email) async {
    try {
      Object data = {'email': email};
      await sendRequest<void>(
        uri: uriBuilder.api("collections/users/request-verification"),
        method: "POST",
        body: data,
      );
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "4a9905c7", details: e);
    }
  }

  @override
  Future<PbAuth> verifyOtp(String otpId, String otp) async {
    try {
      Object data = {
        'otpId': otpId,
        'password': otp,
      };
      return await sendRequest<PbAuth>(
        uri: uriBuilder.api("collections/users/auth-with-otp"),
        method: "POST",
        body: data,
        builder: (responseData) => PbAuth.fromJson(responseData),
      );
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "3146c5bf", details: e);
    }
  }

  @override
  @protected
  Future<T> sendRequest<T>({
    required Uri uri,
    required String method,
    Object? body,
    T Function(dynamic data)? builder,
  }) async {
    try {
      final http.Response response;
      switch (method) {
        case "GET":
          response = await http.get(uri);
        case "POST":
          response = await http.post(uri, body: body);
        case "PATCH":
          response = await http.patch(uri, body: body);
        case "DELETE":
          response = await http.delete(uri);
        default:
          throw CustomException(
              id: "40acfb2e", message: "Method: $method not defined");
      }

      final dynamic data;
      switch (response.statusCode) {
        case 200:
          data = jsonDecode(response.body) as Map<String, dynamic>;
          return builder!(data);
        case 204:
          return null as T;
        default:
          data = jsonDecode(response.body) as Map<String, dynamic>;
          throw CustomException(
              id: "e46ba4ed",
              httpResponseCode: response.statusCode.toString(),
              message: data["message"],
              details: data["data"]);
      }
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "2085905e", details: e);
    }
  }
}

@riverpod
HttpAuthRepository authRepository(Ref ref) {
  return PocketbaseAuthRepository(
    uriBuilder: PocketbaseApiUriBuilder(apiHost: "127.0.0.1", apiPort: 8090),
  );
}


// if you're making multiple requests to the same server, you can keep open a persistent connection by using a Client rather than making one-off requests.
//
// If you do this, make sure to close the client when you're done:
//
// The interface for HTTP clients that take care of maintaining persistent connections across multiple requests to the same server.

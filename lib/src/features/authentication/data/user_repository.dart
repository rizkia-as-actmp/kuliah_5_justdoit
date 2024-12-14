import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/features/authentication/domain/user.dart';
import 'package:justdoit/src/interfaces/api_uri_builder.dart';
import 'package:justdoit/src/interfaces/http_user.repository.dart';
import 'package:justdoit/src/utils/pocketbase_api_uri_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_repository.g.dart';

class PocketbaseUserRepository implements HttpUserRepository {
  PocketbaseUserRepository({
    required this.uriBuilder,
  });

  @override
  final ApiUriBuilder uriBuilder;

  @override
  Future<User> loginUser(String email, String password) async {
    return await sendRequest<User>(
      uri: uriBuilder.api("collections/tescols/records"),
      method: "GET",
      builder: (data) => User.fromJson(data),
    );
  }

  @override
  @protected
  Future<T> sendRequest<T>({
    required Uri uri,
    required String method,
    Object? body,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final http.Response response;
      switch (method) {
        case "GET":
          response = await http.get(uri);
        default:
          throw Exception();
      }

      final dynamic data;
      switch (response.statusCode) {
        case 200:
          data = jsonDecode(response.body) as Map<String, dynamic>;
          return builder(data);
        default:
          data = jsonDecode(response.body) as Map<String, dynamic>;
          throw Exception(data["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
HttpUserRepository userRepository(Ref ref) {
  return PocketbaseUserRepository(
    uriBuilder: PocketbaseApiUriBuilder(apiHost: "127.0.0.1", apiPort: 8090),
  );
}


// if you're making multiple requests to the same server, you can keep open a persistent connection by using a Client rather than making one-off requests.
//
// If you do this, make sure to close the client when you're done:
//
// The interface for HTTP clients that take care of maintaining persistent connections across multiple requests to the same server.

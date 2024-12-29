import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/features/mark/domain/mark.dart';
import 'package:justdoit/src/features/mark/domain/marklist.dart';
import 'package:justdoit/src/interfaces/api_uri_builder.dart';
import 'package:justdoit/src/exceptions/custom_exception.dart';
import 'package:justdoit/src/infrastructure/pocketbase_api_uri_builder.dart';
import 'package:justdoit/src/interfaces/http_mark_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'mark_repository.g.dart';

class PocketbaseMarkRepository implements HttpMarkRepository {
  PocketbaseMarkRepository({
    required this.uriBuilder,
  });

  @override
  final ApiUriBuilder uriBuilder;

  @override
  Future<MarkList> getList() async {
    try {
      return await sendRequest<MarkList>(
          uri: uriBuilder.api("collections/marks/records"),
          method: "GET",
          builder: (responseData) => MarkList.fromJson(responseData));
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "3f64041f", details: e);
    }
  }

  @override
  Future<Mark> getDetail(String markId) async {
    try {
      return await sendRequest<Mark>(
          uri: uriBuilder.api("collections/marks/records/$markId"),
          method: "GET",
          builder: (responseData) => Mark.fromJson(responseData));
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "d92b380e", details: e);
    }
  }

  @override
  Future<Mark> createMark(String title, String content) async {
    try {
      Object data = {
        'title': title,
        'content': content,
      };

      return await sendRequest<Mark>(
        uri: uriBuilder.extendApi("collections/marks/records"),
        method: "POST",
        body: data,
        builder: (responseData) => Mark.fromJson(responseData),
      );
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "5853930b", details: e);
    }
  }

  @override
  Future<Mark> updateMark(String title, String content, String markId) async {
    try {
      Object data = {
        'title': title,
        'content': content,
      };

      return await sendRequest<Mark>(
        uri: uriBuilder.extendApi("collections/marks/records/$markId"),
        method: "PATCH",
        body: data,
        builder: (responseData) => Mark.fromJson(responseData),
      );
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "67e345c8", details: e);
    }
  }

  @override
  Future<void> deleteMark(String markId) async {
    try {
      await sendRequest<void>(
          uri: uriBuilder.api("collections/marks/records/$markId"),
          method: "DELETE");
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(id: "b2db852e", details: e);
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
HttpMarkRepository markRepository(Ref ref) {
  return PocketbaseMarkRepository(
    uriBuilder: PocketbaseApiUriBuilder(apiHost: "127.0.0.1", apiPort: 8090),
  );
}

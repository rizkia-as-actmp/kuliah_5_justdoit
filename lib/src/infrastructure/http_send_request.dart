import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:justdoit/src/exceptions/custom_exception.dart';

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
      default:
        throw CustomException(
            id: "20edecdd", message: "Method: $method not defined");
    }

    if (builder != null) {
      final dynamic data;
      switch (response.statusCode) {
        case 200:
          data = jsonDecode(response.body) as Map<String, dynamic>;
          return builder(data);
        default:
          data = jsonDecode(response.body) as Map<String, dynamic>;
          throw CustomException(
              id: "d267e93f",
              httpResponseCode: response.statusCode.toString(),
              message: data["message"],
              details: data["data"]);
      }
    }
    return null as T;
  } catch (e) {
    if (e is CustomException) rethrow;
    throw CustomException(id: "ca06c78b", details: e);
  }
}

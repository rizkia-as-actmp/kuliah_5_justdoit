import 'package:justdoit/src/interfaces/api_uri_builder.dart';

abstract interface class HttpRepository {
  Future<T> sendRequest<T>({
    required Uri uri,
    required String method,
    Object? body,
    required T Function(dynamic data) builder,
  });

  ApiUriBuilder get uriBuilder;
}

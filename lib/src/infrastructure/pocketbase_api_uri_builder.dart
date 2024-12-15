import 'package:justdoit/src/interfaces/api_uri_builder.dart';

class PocketbaseApiUriBuilder implements ApiUriBuilder {
  PocketbaseApiUriBuilder({required this.apiHost, this.apiPort});

  @override
  final String apiHost;
  @override
  int? apiPort;

  @override
  Uri api(String endpoint) => _buildUri(pathPrefix: "api", endpoint: endpoint);

  // Uri extendApi(String endpoint) =>
  //    _buildUri(pathPrefix: "extend", endpoint: endpoint);

  Uri _buildUri({
    required String pathPrefix,
    required String endpoint,
  }) {
    try {
      if (apiPort != null) {
        return Uri(
          scheme: 'http',
          host: apiHost,
          port: apiPort,
          path: '$pathPrefix/$endpoint',
        );
      }
      return Uri(
        scheme: 'http',
        host: apiHost,
        path: '$pathPrefix/$endpoint',
      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

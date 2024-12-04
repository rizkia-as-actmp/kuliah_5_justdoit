class PocketbaseApi{
  PocketbaseApi({reqyired this.apiKey});
  final String apiKey;

  static const String _apiHost = "localhost:8090";

  Uri api(String endpoint) => _buildUri(
          pathPrefix: "api",
          endpoint: endpoint 
        );

  Uri extendApi(String endpoint) => _buildUri(
          pathPrefix: "extend",
          endpoint: endpoint 
        );

  Uri _buildUri({
      required String pathPrefix,
      required String endpoint,
    }) {
return Uri(
    scheme: 'https',
    host: _apiHost,
    path: "$apiPathPrefix/$apiEndpoint",
    );


//print(httpsUri); // https://dart.dev/guides/libraries/library-tour#numbers

	//curl -X POST http://localhost:8090/api/collections/users/auth-with-password \

    }

  }

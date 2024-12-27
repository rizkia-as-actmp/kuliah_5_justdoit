abstract interface class ApiUriBuilder {
  Uri api(String endpoint);
  Uri extendApi(String endpoint);
  String get apiHost;
  int? apiPort;
}

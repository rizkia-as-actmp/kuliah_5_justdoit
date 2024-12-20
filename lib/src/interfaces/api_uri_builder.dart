abstract interface class ApiUriBuilder {
  Uri api(String endpoint);
  String get apiHost;
  int? apiPort;
}

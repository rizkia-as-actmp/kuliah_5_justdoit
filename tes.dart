void main() {
  // Base API details
  const apiHost = '127.0.0.1:8090';
  const pathPrefix = '/api/collections';
  const endpoint = 'tescols/records/RECORD_ID';

  // Query parameters
  const queryParams = {'expand': 'relField1,relField2.subRelField'};

  // Create the URI
  final uri = Uri(
    scheme: 'http',
    host: apiHost,
    path: '$pathPrefix/$endpoint',
    queryParameters: queryParams,
  );

  print('Generated URI: $uri');
}

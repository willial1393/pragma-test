class _Env {
  late String baseApi;
  late String apiKey;

  _Env() {
    baseApi = _validateEnv(
      const String.fromEnvironment('BASE_API'),
      'BASE_API',
    );
    apiKey = _validateEnv(
      const String.fromEnvironment('API_KEY'),
      'API_KEY',
    );
  }
}

String _validateEnv(String value, String key) {
  if (value.isEmpty) {
    throw Exception('MISSING ENVIRONMENT VARIABLE: $key');
  }
  return value;
}

final environments = _Env();

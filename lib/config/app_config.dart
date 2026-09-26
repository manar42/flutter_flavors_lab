class AppConfig {
  final String environment;
  final String apiUrl;

  const AppConfig({
    required this.environment,
    required this.apiUrl,
  });

  String get flavor => environment;
  bool get isDevelopment => environment.toLowerCase() == 'development';
  bool get isProduction => environment.toLowerCase() == 'production';
}
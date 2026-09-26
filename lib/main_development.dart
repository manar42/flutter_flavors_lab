import 'package:flutter/material.dart';

import 'config/app_config.dart';
import 'main.dart';

void main() {
  const environment = String.fromEnvironment('ENV', defaultValue: 'development');

  const config = AppConfig(
    environment: environment,
    apiUrl: 'https://dev-api.example.com',
  );

  runApp(const MyApp(config: config));
}
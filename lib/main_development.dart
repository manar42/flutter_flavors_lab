import 'package:flutter/material.dart';

import 'config/app_config.dart';
import 'main.dart';

void main() {
  const environment = String.fromEnvironment('ENV');

  const config = AppConfig(
    environment: environment,
    apiUrl: 'https://dev-api.example.com',
  );

  runApp(MyApp(config: config));
}
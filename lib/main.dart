import 'package:flutter/material.dart';

import 'config/app_config.dart';

class MyApp extends StatelessWidget {
  final AppConfig config;

  const MyApp({
    super.key,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Flavors Lab',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Flavors Lab'),
        ),
        body: Center(
          child: Text(
            '${config.environment}\n${config.apiUrl}',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
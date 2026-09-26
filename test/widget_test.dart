import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_flavors_lab/config/app_config.dart';
import 'package:flutter_flavors_lab/main.dart';

void main() {
  testWidgets('Development flavor displays correct configuration', (
    WidgetTester tester,
  ) async {
    const devConfig = AppConfig(
      environment: 'development',
      apiUrl: 'https://dev-api.example.com',
    );

    await tester.pumpWidget(const MyApp(config: devConfig));

    expect(find.text('Flutter Flavors Lab'), findsOneWidget);
    expect(find.text('CURRENT ENVIRONMENT'), findsOneWidget);
    expect(find.text('DEVELOPMENT'), findsOneWidget);
    expect(find.text('https://dev-api.example.com'), findsOneWidget);
    expect(find.text('com.example.flutter_flavors_lab.dev'), findsOneWidget);
  });

  testWidgets('Production flavor displays correct configuration', (
    WidgetTester tester,
  ) async {
    const prodConfig = AppConfig(
      environment: 'production',
      apiUrl: 'https://api.example.com',
    );

    await tester.pumpWidget(const MyApp(config: prodConfig));

    expect(find.text('Flutter Flavors Lab'), findsOneWidget);
    expect(find.text('CURRENT ENVIRONMENT'), findsOneWidget);
    expect(find.text('PRODUCTION'), findsOneWidget);
    expect(find.text('https://api.example.com'), findsOneWidget);
    expect(find.text('com.example.flutter_flavors_lab'), findsOneWidget);
  });
}

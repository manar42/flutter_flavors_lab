import 'package:flutter/material.dart';

import 'config/app_config.dart';

void main() {
  const env = String.fromEnvironment('ENV', defaultValue: 'development');
  final isProduction = env.toLowerCase() == 'production';

  final config = isProduction
      ? const AppConfig(
          environment: env,
          apiUrl: 'https://api.example.com',
        )
      : const AppConfig(
          environment: env,
          apiUrl: 'https://dev-api.example.com',
        );

  runApp(MyApp(config: config));
}

class MyApp extends StatelessWidget {
  final AppConfig config;

  const MyApp({
    super.key,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    final isDev = config.isDevelopment;
    final primarySeed = isDev ? Colors.teal : Colors.indigo;

    return MaterialApp(
      title: 'Flutter Flavors Lab',
      debugShowCheckedModeBanner: isDev,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primarySeed,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primarySeed,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: HomeScreen(config: config),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final AppConfig config;

  const HomeScreen({
    super.key,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDev = config.isDevelopment;
    final primaryColor = theme.colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Flavors Lab',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: theme.colorScheme.outlineVariant,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 28,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Section 1: Current Environment
                      Text(
                        'CURRENT ENVIRONMENT',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.labelMedium?.copyWith(
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: isDev
                              ? Colors.teal.withValues(alpha: 0.12)
                              : Colors.indigo.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: isDev ? Colors.teal : Colors.indigo,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              isDev
                                  ? Icons.developer_mode_rounded
                                  : Icons.verified_rounded,
                              color: isDev ? Colors.teal : Colors.indigo,
                              size: 24,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              config.environment.toUpperCase(),
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.2,
                                color: isDev ? Colors.teal : Colors.indigo,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),
                      const Divider(height: 1),
                      const SizedBox(height: 20),

                      // Section 2: Environment
                      _buildInfoTile(
                        context,
                        label: 'Environment',
                        value: config.environment,
                        icon: Icons.tune_rounded,
                      ),

                      const SizedBox(height: 16),

                      // Section 3: API URL
                      _buildInfoTile(
                        context,
                        label: 'API URL',
                        value: config.apiUrl,
                        icon: Icons.link_rounded,
                        isMonospace: true,
                      ),

                      const SizedBox(height: 16),

                      // Section 4: Flavor
                      _buildInfoTile(
                        context,
                        label: 'Flavor',
                        value: config.flavor,
                        icon: Icons.layers_outlined,
                      ),

                      const SizedBox(height: 16),

                      // Section 5: Application ID
                      _buildInfoTile(
                        context,
                        label: 'Application ID',
                        value: isDev
                            ? 'com.example.flutter_flavors_lab.dev'
                            : 'com.example.flutter_flavors_lab',
                        icon: Icons.fingerprint_rounded,
                        isMonospace: true,
                      ),

                      const SizedBox(height: 24),
                      const Divider(height: 1),
                      const SizedBox(height: 16),

                      // Footer Note
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            size: 16,
                            color: primaryColor,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              isDev
                                  ? 'Development build: uses .dev application ID suffix and development endpoint.'
                                  : 'Production build: uses release application ID and production endpoint.',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
    bool isMonospace = false,
  }) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            value,
            style: isMonospace
                ? TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  )
                : theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
          ),
        ),
      ],
    );
  }
}
# Flutter Flavors Lab

A practical Flutter project demonstrating how to manage multiple environments from a single codebase using **Flutter Flavors**.

## Features

* Development & Production flavors
* Different app names for each flavor
* Different Application IDs
* Environment-specific configuration
* Multiple Flutter entry points
* `--dart-define` environment variables
* VS Code launch configurations
* Development & Production APK builds

## Project Structure

```text
lib/
├── config/
│   └── app_config.dart
├── main.dart
├── main_development.dart
└── main_production.dart

android/
└── app/
    ├── build.gradle.kts
    └── src/
        └── main/
            └── AndroidManifest.xml

.vscode/
└── launch.json
```

## Flavors

### Development

* Flavor: `development`
* Environment: `development`
* App Name: `Flavors Lab Development`
* Application ID: `<base-id>.dev`

### Production

* Flavor: `production`
* Environment: `production`
* App Name: `Flavors Lab Production`
* Application ID: `<base-id>`

The different Application IDs allow both versions to be installed on the same Android device.

## Environment Configuration

The project uses a shared `AppConfig` to provide environment-specific values while keeping the application code shared.

Example:

```dart
const config = AppConfig(
  environment: 'development',
  apiUrl: 'https://dev-api.example.com',
);
```

The Production entry point provides its own configuration.

## `--dart-define`

Environment values can be passed at runtime/build time using `--dart-define`.

### Development

```bash
flutter run --flavor development --dart-define=ENV=development
```

### Production

```bash
flutter run --flavor production --dart-define=ENV=production
```

The value is accessed in Dart using:

```dart
const environment = String.fromEnvironment('ENV');
```

## VS Code

The project includes `.vscode/launch.json` with separate configurations for:

* Development
* Production

This allows each flavor to be launched directly from **Run and Debug** without entering the full command manually.

## Build APK

### Development

```bash
flutter build apk --flavor development --dart-define=ENV=development
```

### Production

```bash
flutter build apk --flavor production --dart-define=ENV=production
```

## Flavor vs Build Mode

**Flavor** determines the application environment:

```text
Development / Production
```

**Build Mode** determines how the application is built:

```text
Debug / Profile / Release
```

They can be used together, for example:

```text
Development + Debug
Production + Release
```

## Tech Stack

* Flutter
* Dart
* Android Gradle
* Kotlin DSL
* VS Code
* Flutter Flavors
* `--dart-define`

# Product Hunt

[![Coverage](https://github.com/phuongpt/product_hunt/actions/workflows/main.yml/badge.svg)](https://github.com/phuongpt/product_hunt/actions/workflows/main.yml)

The project is a mobile application built with Flutter that serves as a platform to discover and share new products, from Product Hunt. It uses Bloc as the state management and architecture. The project use GraphQL to communicate with the backend.

The project also uses Very Good CLI

---
## Showcase
![showcase](https://github.com/phuongpt/product_hunt/blob/develop/docs/videos/product-hunt.mov) 

---

## Getting Started

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

---

## Architecture
The application uses Bloc as the state management library, which follows a unidirectional data flow pattern. The app has the following directory structure:

```sh
lib/
|-- core/
    |-- constants/
    |-- extensions/
    |-- helpers/
|-- data/
    |-- apis/
    |-- models/
    |-- repositories/
|-- features/
    |-- post/
        |-- bloc/
        |-- view/
        |-- widgets/
main.dart

```

---

## Third-Party Libraries
The application utilizes the following third-party libraries:

`animate_do`: Used for animations.

`styled_widget`: Used for styling.

`graphql_flutter`: Used to communicate with the backend using GraphQL.

---


## Running Tests
The application has unit tests for: 

`repositories`,

`Bloc`,
 
`Widgets`

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage
```

---

## Build
Android: 

`repositories`,

`Bloc`,
 
`Widgets`

To run all unit and widget tests use the following command:


```sh
# Development
$ flutter build apk --target lib/main_development.dart --flavor development --release -v

# Staging
$ flutter build apk --target lib/main_staging.dart --flavor staging --release -v

# Production
$ flutter build apk --target lib/main_production.dart --flavor production --release -v
```

---

## Working with Translations

This project relies on [flutter_localizations][https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html] and follows the [official internationalization guide for Flutter][https://flutter.dev/docs/development/accessibility-and-localization/internationalization].


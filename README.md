# Product Hunt

[![Coverage](https://github.com/phuongpt/product_hunt/actions/workflows/main.yaml/badge.svg)](https://github.com/phuongpt/product_hunt/actions/workflows/main.yaml)

The project is a mobile application built with Flutter that serves as a platform to discover and share new products, from Product Hunt. It uses Bloc as the state management and architecture. The project use GraphQL to communicate with the backend.

The project also uses Very Good CLI

---
## Showcase


https://user-images.githubusercontent.com/4443583/231635865-ad6bcc51-2300-4e67-b415-a309a56456c8.mp4
<div style="display: flex;">
  <div style="flex: 1;">
    https://github.com/phuongpt/nextjs-2fa/blob/develop/docs/images/screen1.png
  </div>
  <div style="flex: 1;">
    https://github.com/phuongpt/nextjs-2fa/blob/develop/docs/images/screen2.png
  </div>
  <div style="flex: 1;">
    https://github.com/phuongpt/nextjs-2fa/blob/develop/docs/images/screen3.png
  </div>
  <div style="flex: 1;">
    https://github.com/phuongpt/nextjs-2fa/blob/develop/docs/images/screen4.png
  </div>
  <div style="flex: 1;">
    https://github.com/phuongpt/nextjs-2fa/blob/develop/docs/images/screen5png
  </div>
</div>
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

`Repository`

`Bloc`
 
`Widget`

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage
```

---

## Build
Android: 

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

This project relies on `flutter_localizations`.


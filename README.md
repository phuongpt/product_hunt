# Product Hunt

[![Coverage](https://github.com/phuongpt/product_hunt/actions/workflows/main.yaml/badge.svg?branch=develop)](https://github.com/phuongpt/product_hunt/actions/workflows/main.yaml)
![style: very good analysis][very_good_analysis_badge]

The project is a mobile application built with Flutter that serves as a platform to discover and share new products, from Product Hunt. It uses Bloc as the state management and architecture. The project uses GraphQL to communicate with the backend.

And [Crybse](https://github.com/phuongpt/crybse) is another project which uses RiverPod and clean architecture

---
## Showcase


https://user-images.githubusercontent.com/4443583/231635865-ad6bcc51-2300-4e67-b415-a309a56456c8.mp4
   
<div style="display: flex; flex-direction">
  <img style="width: 18%;" src="https://github.com/phuongpt/product_hunt/blob/develop/docs/images/screen1.png" alt="Image description">
  <img style="width: 18%;" src="https://github.com/phuongpt/product_hunt/blob/develop/docs/images/screen2.png" alt="Image description">
  <img style="width: 18%;" src="https://github.com/phuongpt/product_hunt/blob/develop/docs/images/screen3.png" alt="Image description">
  <img style="width: 18%;" src="https://github.com/phuongpt/product_hunt/blob/develop/docs/images/screen4.png" alt="Image description">
  <img style="width: 18%;" src="https://github.com/phuongpt/product_hunt/blob/develop/docs/images/screen5.png" alt="Image description">
</div>
---

## Architecture
The application uses Bloc as the state management library, which follows a unidirectional data flow pattern. 
The app has the following directory structure:

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

```sh
# Development
$ flutter build apk --target lib/main_development.dart --flavor development --release -v

# Staging
$ flutter build apk --target lib/main_staging.dart --flavor staging --release -v

# Production
$ flutter build apk --target lib/main_production.dart --flavor production --release -v
```

[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
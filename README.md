# My Favorite Books

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

---

## Getting Started 🚀

In order to run the project, you need to get an API key first from [Google Books API](https://developers.google.com/books/docs/v1/using#APIKey). After you get the API key, you need to create a `.env` file in the root directory and add the following line:

```sh
API_KEY=YOUR_API_KEY
```

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main.dart  --dart-define APP_ENV=dev

# Staging
$ flutter run --flavor staging --target lib/main.dart --dart-define APP_ENV=stage

# Production
$ flutter run --flavor production --target lib/main.dart --dart-define APP_ENV=prod

```

_\*This project is tested on iOS and Android._

## Summary of the Project

- This project uses Google Books API to fetch books and display them in a list. You can search for books using the search bar and add books to your favorites list. Remove them from the list if you wish. It's created using the [Very Good CLI][very_good_cli_link].
- This is a project that mainly uses BLoC with clean architecture pattern.
- API tests are written using Mockito.

## Used Packages

- [dio](https://pub.dev/packages/dio) and [retrofit](https://pub.dev/packages/retrofit) for network calls.
- [fancy_dio_inspector](https://pub.dev/packages/fancy_dio_inspector) for network call inspection _(It's written by [me](https://github.com/yakupemeksiz) and [Gökhan Çavuş](https://github.com/gokhancvs))_.
- [equatable](https://pub.dev/packages/equatable) for value equality.
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management.
- [get_it](https://pub.dev/packages/get_it) and [injectable](https://pub.dev/packages/injectable) for dependency injection.
- [mockito](https://pub.dev/packages/mockito) for mocking.
- [easy_localization](https://pub.dev/packages/easy_localization) for localization.
- [either_dart](https://pub.dev/packages/either_dart) for error handling.
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) for responsive UI.
- [hive_flutter](https://pub.dev/packages/hive_flutter) for local storage.

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli

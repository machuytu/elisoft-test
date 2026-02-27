# Elisoft Flutter

A Flutter application that displays images in a launcher-like 7x10 grid, with
horizontal pagination, quick add, full reload, and EN/VI localization.

## Features

- Paged image grid: **70 items per page** (7 columns x 10 rows).
- Full reload: **140 items** (2 pages).
- **+** action to add one new image.
- Smooth horizontal paging.
- Uses `cached_network_image` for image caching and better scrolling
  performance.
- ARB-based localization (`app_en.arb`, `app_vi.arb`).
- Feature-based clean architecture with Riverpod.
- Dependency injection with `get_it`.

## Tech Stack

- Flutter + Dart
- `flutter_riverpod`
- `get_it`
- `freezed_annotation` / `freezed`
- `equatable`
- `cached_network_image`

## Project Structure

```text
lib/
├── app.dart
├── main.dart
├── core/
│   ├── constants/
│   ├── di/
│   └── router/
├── features/
│   └── image_grid/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── l10n/
```

## Requirements

- Flutter SDK 3.x
- Dart SDK version defined in `pubspec.yaml`
- Android Studio or VSCode with Flutter extension

## Getting Started

```bash
flutter pub get
flutter run
```

## Useful Commands

```bash
# Static analysis
flutter analyze

# Run tests
flutter test

# Generate code (freezed, etc.)
dart run build_runner build --delete-conflicting-outputs
```

## Localization

ARB files:

- `lib/l10n/app_en.arb`
- `lib/l10n/app_vi.arb`

A VSCode task is included to auto-fill missing VI keys from EN and regenerate
l10n output.

## Performance Notes

- `cached_network_image` is used to improve caching and paging performance.
- Image URLs are generated from seeds (`picsum.photos/seed/...`) to avoid
  blocking startup with large prefetch calls.

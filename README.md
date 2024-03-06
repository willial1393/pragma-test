# pragma

Application for pragma.

## Getting Started

Install flutter 3.19.1

Create `config.json` file on root directory

```bash
flutter pub get
```

## Run

```bash
flutter run --dart-define-from-file="config.json"
```

## Build

```bash
flutter build apk --release --dart-define-from-file="config.json"
```

## Generate code

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Generate App Icon

```bash
flutter pub run flutter_launcher_icons
```

## Generate Splash Screen

```bash
flutter pub run flutter_native_splash:create
```
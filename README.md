# Flutter Mobile Platform Showcase

A lightweight technical showcase demonstrating Flutter's capability to integrate with native mobile platforms. It focuses on practical implementation patterns for Firebase Cloud Messaging (FCM), local notifications, and native platform channels.

**Note:** This repository is intended as a reference implementation for engineers and reviewers. It is intentionally minimal and avoids unrelated features like complex UI, state management, or networking.

## Features Demonstrated

1. **Firebase Initialization & FCM**
   - Headless initialization of Firebase Core (using dummy credentials for demonstration).
   - Setting up foreground and background message handlers via `firebase_messaging`.
   - Handling push notifications without full backend infrastructure requirements for local testing.

2. **Local Notifications**
   - Configuring `flutter_local_notifications` for Android and iOS.
   - Surfacing FCM background/foreground payloads as interactive local notifications.
   - Handling permission requests safely across both platforms.

3. **Platform Channels (MethodChannel)**
   - Two-way communication between Dart and native host code.
   - Requesting device-specific information asynchronously via a simple `MethodChannel` (`com.example.showcase/info`).
   - Native implementations in **Kotlin** (Android) and **Swift** (iOS).

## Project Structure

The codebase is organized purely by feature to ensure it remains lightweight and easy to review:

```text
lib/
├── features/        # Simple UI components (HomePage)
├── firebase/        # Firebase initialization and setup
├── notifications/   # Local notification configuration and FCM event routing
├── platform/        # Platform channel wrappers (MethodChannel calls)
└── main.dart        # Application entry point
```

## Setup & Configuration

### Prerequisites
- Flutter SDK (stable channel recommended)
- Android Studio / Xcode for native platform builds

### Firebase Configuration
This repository uses placeholder values in `lib/firebase/firebase_setup.dart` to compile and run out of the box without throwing initialization errors. 

**To connect this project to a real Firebase environment:**
1. Create a project in the [Firebase Console](https://console.firebase.google.com/).
2. Run `flutterfire configure` at the root of the project.
3. Replace the placeholder `FirebaseOptions` in `FirebaseSetup` with the generated `DefaultFirebaseOptions.currentPlatform`.
4. DO NOT commit the generated `firebase_options.dart` file or real API keys to version control.

### Building & Running

Run the application on an emulator or physical device:

```bash
flutter run
```

## Testing

This project includes focused tests for UI interactions and mocked MethodChannel responses, avoiding superficial test coverage metrics. 

Run the tests using:

```bash
flutter test
```

## Out of Scope
To maintain a tight focus on platform integration, the following are intentionally omitted:
- Complex state management patterns (e.g., BLoC, Riverpod)
- Deep navigation or routing configurations
- Production CI/CD pipelines
- Extraneous Firebase services (Firestore, Auth, Crashlytics, etc.)

# אורות השחר - Orot HaShachar

A Hebrew mobile application for presenting the new Jewish political party "אורות השחר" (Lights of Dawn).

## Features

- **Hebrew RTL Support**: Full right-to-left text layout for Hebrew language
- **Beautiful Splash Screen**: Animated splash screen with party logo
- **Party Presentation**: Comprehensive presentation of party values and mission
- **Modern Design**: Clean, professional Material Design 3 interface
- **Responsive Layout**: Works seamlessly on all screen sizes

## Party Values

The app presents the following core values:
- 🌟 **יהדות** (Judaism): Deep connection to Jewish heritage and Torah values
- 🚩 **ציונות** (Zionism): Commitment to the Zionist enterprise and nation-building
- 👥 **דמוקרטיה** (Democracy): Upholding democratic values and equal rights
- ❤️ **אחדות** (Unity): Bringing hearts together and connecting all parts of the nation
- 💡 **חדשנות** (Innovation): Innovative solutions for current and future challenges
- 🌱 **סביבה** (Environment): Environmental responsibility and nature conservation

## Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / Xcode (for iOS development)

### Installation

1. Clone the repository
2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
# For Android
flutter run

# For iOS
flutter run

# For specific device
flutter run -d <device_id>
```

### Building for Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release
```

## Project Structure

```
lib/
├── main.dart           # Main app entry point
    ├── OrotHaShacharApp    # Root app widget
    ├── SplashScreen        # Animated splash screen
    └── HomePage            # Main presentation page

assets/
└── or.png              # Party logo

android/                # Android-specific configuration
ios/                    # iOS-specific configuration
```

## Customization

### Changing Colors

The app uses a deep blue color scheme. To change colors, edit the theme in `lib/main.dart`:

```dart
theme: ThemeData(
  primaryColor: const Color(0xFF1E3A8A), // Change this color
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF1E3A8A), // And this one
  ),
),
```

### Updating Content

All Hebrew content is directly in the `lib/main.dart` file and can be easily modified.

## Technologies Used

- **Flutter**: Cross-platform mobile framework
- **Material Design 3**: Modern, beautiful UI components
- **Dart**: Programming language

## License

This project is created for the "אורות השחר" political party.

## Support

For issues or questions, please contact the party representatives.

---

**Built with Flutter** 💙

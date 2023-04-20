# mdlive_healthcare_app_ui

A Flutter Health Care mobile application which connects a patient with a certified doctor regardless of where they are or when they need an appointment.

## Screenshots

<img  src="screenshots/Screenshot_20230420-112053.jpg" width="250" height="500" title="Home Page 1" alt="Screenshot 1"/>
<img  src="screenshots/Screenshot_20230420-112116.jpg" width="250" height="500" title="Home Page 2" alt="Screenshot 2"/>
<img  src="screenshots/Screenshot_20230420-112138.jpg" width="250" height="500" title="Call Page" alt="Screenshot 3"/>
<img  src="screenshots/Screenshot_20230420-112151.jpg" width="250" height="500" title="Chat Page 1" alt="Screenshot 4"/>
<img  src="screenshots/Screenshot_20230420-112157.jpg" width="250" height="500" title="Chat Page 2" alt="Screenshot 5"/>

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

  bottom_nav:
    git:
      url: git@github.com:kenresoft/bottom_nav.git
      ref: master
  fontresoft:
    git:
      url: git@github.com:kenresoft/fontresoft.git
      ref: master
  extensionresoft:
    git:
      url: git@github.com:kenresoft/extensionresoft.git
      ref: master
  cupertino_icons: ^1.0.5
  go_router: ^6.5.7
  flutter_riverpod: ^2.3.5
  fluttertoast: ^8.2.1

```

### Image Resources

```html

<ol>
    <li> bg_2.jpg</li>
    <li> doctor.jpg</li>
    <li> profile.png</li>
    <li> patient.jpg</li>
    <li> main.jpg</li>
    <li> health_3.jpg</li>
    <li> health_2.jpg</li>
    <li> health.jpg</li>
    <li> doctor_6.jpg</li>
    <li> doctor_5.jpg</li>
    <li> doctor_4.jpg</li>
    <li> doctor_3.jpg</li>
    <li> doctor_2.jpg</li>
    <li> doctor_1.jpg</li>
</ol>
```

### Screens

```dart
  //Navigation routes
static const String home = '/home';
static const String chat = '/chat';
static const String call = '/call';
static const String error = '/error';
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

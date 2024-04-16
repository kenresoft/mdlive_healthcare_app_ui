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

  fontresoft: ^0.0.5
  extensionresoft: ^0.0.5
  cupertino_icons: ^1.0.6
  go_router: ^13.2.4
  flutter_riverpod: ^2.5.1
  fluttertoast: ^8.2.5
```

### Image Resources

- bg_2.jpg
- doctor.jpg
- profile.png
- patient.jpg
- main.jpg
- health_3.jpg
- health_2.jpg
- health.jpg
- doctor_6.jpg
- doctor_5.jpg
- doctor_4.jpg
- doctor_3.jpg
- doctor_2.jpg
- doctor_1.jpg

### Screens

```dart
  //Navigation routes
static const String home = '/home';
static const String chat = '/chat';
static const String call = '/call';
static const String error = '/error';
```

## Attribution

Design by [Dmitry Lauretsky](https://dribbble.com/dlauretsky) on [Dribble](https://dribbble.com/shots/14666521-MDlive-Health-Care-App-Redesign)

App written in Flutter

Developed [kenresoft](https://kenresoft.github.io)

## License

```text
Copyright (c) 2023 Kenneth K. Amadi

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
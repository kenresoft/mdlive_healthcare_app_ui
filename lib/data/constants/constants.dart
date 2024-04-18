
class Constants {
  Constants._();

  static const String appName = 'Health Care App UI';
  static const String root = '/';

  //Navigation routes
  static const String home = '/home';
  static const String chat = '/chat';
  static const String call = '/call';
  static const String error = '/error';

  //Images route
  static const String imageDir = "assets/images";
  static const String iconDir = "assets/icons";

  //Images
  static const String profile = "$imageDir/profile.png";
  static const String main = "$imageDir/main.jpg";
  static const String bg = "$imageDir/bg.jpg";
  static const String bg_2 = "$imageDir/bg_2.jpg";
  static const String doctor = "$imageDir/doctor.jpg";
  static const String toonDoc = "$imageDir/toon-doc.png";
  static const String doctor_1 = "$imageDir/doctor_1.jpg";
  static const String doctor_2 = "$imageDir/doctor_2.jpg";
  static const String doctor_3 = "$imageDir/doctor_3.jpg";
  static const String doctor_4 = "$imageDir/doctor_4.jpg";
  static const String doctor_5 = "$imageDir/doctor_5.jpg";
  static const String doctor_6 = "$imageDir/doctor_6.jpg";
  static const String patient = "$imageDir/patient.jpg";
  static const String health = "$imageDir/health.jpg";
  static const String health_2 = "$imageDir/health_2.jpg";
  static const String health_3 = "$imageDir/health_3.jpg";

  static List<String> get healthIcons => [health, health_2, health_3];

  //Icons
  static const String appIcon = "$iconDir/icon.png";

  // Dimension
  static const double wrapWidth = 105;
}

import '../constants/constants.dart';

class HealthCategory {
  const HealthCategory({
    this.title,
    this.picture,
    this.doctorsAvailable,
  });

  final String? title;
  final String? picture;
  final int? doctorsAvailable;

  static List<HealthCategory> get getAll {
    return [
      const HealthCategory(title: 'Cardiology', doctorsAvailable: 15, picture: Constants.health),
      const HealthCategory(title: 'Ophthalmology', doctorsAvailable: 4, picture: Constants.health_2),
      const HealthCategory(title: 'Psychology', doctorsAvailable: 2, picture: Constants.health_3),
    ];
  }
}

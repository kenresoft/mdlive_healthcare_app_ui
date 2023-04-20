import '../constants/constants.dart';

class Doctor {
  const Doctor({
    this.name,
    this.picture,
    this.role,
    this.availability,
    this.message,
    this.messageCount,
  });

  final String? name;
  final String? picture;
  final String? role;
  final String? availability;
  final String? message;
  final int? messageCount;

  static List<Doctor> get getAll {
    return [
      const Doctor(
        name: 'Dr. John Arthur',
        availability: '15',
        role: 'Surgeon',
        picture: Constants.doctor_2,
        message: 'Hello, how can i help you?',
        messageCount: 3,
      ),
      const Doctor(
        name: 'Dr. Sarah Parson',
        availability: '15',
        role: 'Gynaecologist',
        picture: Constants.doctor_1,
        message: 'What was your last meal?',
        messageCount: 1,
      ),
      const Doctor(
        name: 'Dr. Martha Rose',
        availability: '4',
        role: 'Cardiologist',
        picture: Constants.doctor_4,
        message: 'Thank you for visiting',
        messageCount: 0,
      ),
      const Doctor(
        name: 'Dr. Elizabeth Scott',
        availability: '2',
        role: 'Surgeon',
        picture: Constants.doctor_5,
        message: 'I have a bad headache',
        messageCount: 2,
      ),
      const Doctor(
        name: 'Dr. Pascal Moran',
        availability: '2',
        role: 'Gynaecologist',
        picture: Constants.doctor_3,
        message: 'Don\'t forget to have some rest',
        messageCount: 0,
      ),
      const Doctor(
        name: 'Dr. Anna Handy',
        availability: '2',
        role: 'Cardiologist',
        picture: Constants.doctor_6,
        message: 'Incoming video call',
        messageCount: 1,
      ),
      const Doctor(
        name: 'Dr. John Arthur',
        availability: '15',
        role: 'Surgeon',
        picture: Constants.doctor_2,
        message: 'Hello, how can i help you?',
        messageCount: 3,
      ),
    ];
  }
}

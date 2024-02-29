// ignore_for_file: file_names
class UserRegistration {
  final String firstName;
  final String lastName;
  final String gender;
  final String phoneNumber;
  final DateTime birthDate;
  final String state;
  final String city;
  final String pinCode;
  final String fullAddress;
  final bool termsAccepted;
  final DateTime registrationTime; // New field to store registration time
  final String userType;

  UserRegistration({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.phoneNumber,
    required this.birthDate,
    required this.state,
    required this.city,
    required this.pinCode,
    required this.fullAddress,
    required this.termsAccepted,
    this.userType = "Citizen",
    DateTime?
        registrationTime, // Nullable DateTime to allow automatic assignment
  }) : registrationTime =
            registrationTime ?? DateTime.now(); // Assign current time if null

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'phoneNumber': "+91$phoneNumber",
      'birthDate': birthDate,
      'state': state,
      'city': city,
      'pinCode': pinCode,
      'fullAddress': fullAddress,
      'termsAccepted': termsAccepted,
      'registrationTime': registrationTime.toString(),
      'userType': "Citizen"
    };
  }
}

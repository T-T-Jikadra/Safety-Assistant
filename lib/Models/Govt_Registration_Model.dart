// ignore_for_file: file_names, non_constant_identifier_names
class GovtRegistration {
  final String GovtAgencyName;
  final String GovtAgencyARegNo;
  final String services;
  final String contactNumber;
  final String email;
  final String website;
  final String state;
  final String city;
  final String pinCode;
  final String fullAddress;
  final String password;
  final String confirmPassword;
  final bool termsAccepted;
  final DateTime registrationTime; // New field to store registration time
  final String deviceToken;


  GovtRegistration({
    required this.GovtAgencyName,
    required this.GovtAgencyARegNo,
    required this.services,
    required this.contactNumber,
    required this.email,
    required this.website,
    required this.state,
    required this.city,
    required this.pinCode,
    required this.fullAddress,
    required this.password,
    required this.confirmPassword,
    required this.termsAccepted,
    required this.deviceToken,
    DateTime?
    registrationTime, // Nullable DateTime to allow automatic assignment
  }) : registrationTime =
      registrationTime ?? DateTime.now(); // Assign current time if null

  Map<String, dynamic> toJsonGovt() {
    return {
      'GovtAgencyName': GovtAgencyName,
      'GovtAgencyRegNo': GovtAgencyARegNo,
      'services': services,
      'contactNumber': "+91$contactNumber",
      'website': website,
      'email': email,
      'state': state,
      'city': city,
      'pinCode': pinCode,
      'fullAddress': fullAddress,
      'password': password,
      'confirmPassword': confirmPassword,
      'termsAccepted': termsAccepted,
      'registrationTime': registrationTime.toString(),
      'deviceToken': deviceToken,
    };
  }
}

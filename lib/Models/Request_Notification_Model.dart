// ignore_for_file: file_names
class Request_Notification {
  final String ngoName;
  final String ngoRegNo;
  final String services;
  final String contactNumber;
  final String email;
  final String state;
  final String city;
  final String pinCode;

  final DateTime requestTime; // New field to store registration time
  final String deviceToken;

  Request_Notification({
    required this.ngoName,
    required this.ngoRegNo,
    required this.services,
    required this.contactNumber,
    required this.email,
    required this.state,
    required this.city,
    required this.pinCode,
    required this.deviceToken,
    DateTime?
    requestTime, // Nullable DateTime to allow automatic assignment
  }) : requestTime =
      requestTime ?? DateTime.now(); // Assign current time if null

  Map<String, dynamic> toJson() {
    return {
      // 'nameOfNGO': ngoName,
      // 'NGORegNo': ngoRegNo,
      // 'services': services,
      // 'contactNumber': "+91$contactNumber",
      // 'email': email,
      // 'state': state,
      // 'city': city,
      // 'pinCode': pinCode,
      // 'fullAddress': fullAddress,
      // 'password': password,
      // 'requestTime': requestTime.toString(),
      // 'deviceToken': deviceToken,
    };
  }
}

// ignore_for_file: file_names, camel_case_types
class Request_Notification {
  final String ngoName;
  final String ngoRegNo;
  final String services;
  final String contactNumber;
  final String email;
  final String pinCode;
  final String city;
  final String state;
  final DateTime requestTime;
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
    DateTime? requestTime,
  }) : requestTime = requestTime ?? DateTime.now();

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

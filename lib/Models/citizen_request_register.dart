// ignore_for_file: file_names, non_constant_identifier_names

class CitizenReqRegistration {
  final String Rid;
  final String neededService;
  final String location;
  final String userName;
  final String contactNumber;
  final String senderToken;
  final String website;
  final String state;
  final String city;
  final String pinCode;
  final String fullAddress;
  final String password;
  final bool isTransactionCompleted;
  final DateTime requestTime;

  //final String deviceToken;

  CitizenReqRegistration(
      {required this.Rid,
      required this.neededService,
      required this.location,
      required this.userName,
      required this.contactNumber,
      required this.senderToken,
      required this.website,
      required this.state,
      required this.city,
      required this.pinCode,
      required this.fullAddress,
      required this.password,
      required this.isTransactionCompleted,
      // required this.isTransactionCompleted,
      DateTime? requestTime})
      : requestTime = requestTime ?? DateTime.now();

  Map<String, dynamic> toJsonGovt() {
    return {
      'RequestId': Rid,
      'neededService': neededService,
      'GovtAgencyRegNo': location,
      'services': userName,
      'contactNumber': "+91$contactNumber",
      'senderToken': senderToken,
      'website': website,
      'state': state,
      'city': city,
      'pinCode': pinCode,
      'fullAddress': fullAddress,
      'password': password,
      'isTransactionCompleted': isTransactionCompleted,
      'registrationTime': requestTime.toString(),
      // 'deviceToken': deviceToken,
    };
  }
}

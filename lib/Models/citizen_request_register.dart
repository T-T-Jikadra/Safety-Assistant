// ignore_for_file: file_names, non_constant_identifier_names

class CitizenReqRegistration {
  final String Rid;
  final String neededService;
  final String userName;
  final String? contactNumber;
  final String state;
  final String city;
  final String pinCode;
  final String fullAddress;
  final bool isTransactionCompleted;
  final DateTime requestTime;
  final String senderToken;

  CitizenReqRegistration(
      {required this.Rid,
      required this.neededService,
      required this.userName,
      required this.contactNumber,
      required this.state,
      required this.city,
      required this.pinCode,
      required this.fullAddress,
      required this.isTransactionCompleted,
      required this.senderToken,
      DateTime? requestTime})
      : requestTime = requestTime ?? DateTime.now();

  Map<String, dynamic> toJsonReq() {
    return {
      'RequestId': Rid,
      'neededService': neededService,
      'services': userName,
      'contactNumber': contactNumber,
      'senderToken': senderToken,
      'state': state,
      'city': city,
      'pinCode': pinCode,
      'fullAddress': fullAddress,
      'isTransactionCompleted': isTransactionCompleted,
      'registrationTime': requestTime.toString(),
    };
  }
}

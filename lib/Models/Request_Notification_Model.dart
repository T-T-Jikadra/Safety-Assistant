// ignore_for_file: file_names, camel_case_types
class Response_Registration {
  final String respondId;
  final String responderName;
  final String responderRegNo;
  final String responderAddress;
  final String? responderContactNo;
  final String responderEmail;
  final String responderWebsite;
  final DateTime respondTime;
  // final String deviceToken;

  Response_Registration({
    required this.respondId,
    required this.responderName,
    required this.responderRegNo,
    required this.responderAddress,
    required this.responderContactNo,
    required this.responderEmail,
    required this.responderWebsite,
    // required this.deviceToken,
    DateTime? respondTime,
  }) : respondTime = respondTime ?? DateTime.now();

  Map<String, dynamic> toRespondJson() {
    return {
      'RespondId': respondId,
      'ResponderName': responderName,
      'ResponderRegNo': responderRegNo,
      'ResponderAddress': responderAddress,
      'ResponderContactNumber':responderContactNo,
      'ResponderEmail':responderEmail,
      'ResponderWebsite':responderWebsite,
      'RespondTime': respondTime.toString(),
      // 'deviceToken':deviceToken,
    };
  }
}

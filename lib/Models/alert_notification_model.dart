// ignore_for_file: file_names, non_constant_identifier_names

class AlertNotificationRegistration {
  final String AlertId;
  final String did;
  final String typeofDisaster;
  final String desc;
  final String level;
  final String state;
  final String city;
  final String senderToken;
  final DateTime sentTime;

  AlertNotificationRegistration(
      {required this.AlertId,
      required this.did,
      required this.typeofDisaster,
      required this.desc,
      required this.level,
      required this.senderToken,
      required this.state,
      required this.city,
      DateTime? sentTime})
      : sentTime = sentTime ?? DateTime.now();

  Map<String, dynamic> toJsonGovt() {
    return {
      'AlertId': AlertId,
      'did':did,
      'typeofDisaster': typeofDisaster,
      'description': desc,
      'level': level,
      'senderToken': senderToken,
      'state': state,
      'city': city,
      'sentTime': sentTime.toString(),
    };
  }
}

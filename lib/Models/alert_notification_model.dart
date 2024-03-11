// ignore_for_file: file_names, non_constant_identifier_names

class AlertNotificationRegistration {
  final String AlertId;
  final String typeofDisaster;
  final String desc;
  final String level;
  final String state;
  final String city;
  //final String dos_donts;
  final String senderToken;
  final DateTime sentTime;

  AlertNotificationRegistration(
      {required this.AlertId,
      required this.typeofDisaster,
      required this.desc,
      required this.level,
      //required this.dos_donts,
      required this.senderToken,
      required this.state,
      required this.city,
      DateTime? sentTime})
      : sentTime = sentTime ?? DateTime.now();

  Map<String, dynamic> toJsonGovt() {
    return {
      'AlertId': AlertId,
      'typeofDisaster': typeofDisaster,
      'description': desc,
      'level': level,
      //"do&don't": dos_donts,
      'senderToken': senderToken,
      'state': state,
      'city': city,
      'sentTime': sentTime.toString(),
    };
  }
}

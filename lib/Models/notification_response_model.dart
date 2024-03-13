// ignore_for_file: file_names, camel_case_types

class NGO_Response_Registration {
  final String respondId;
  final String nid;
  final String responderNGOName;
  final String responderNGORegNo;
  final String responderNGOAddress;
  final String? responderNGOContactNo;
  final String responderNGOEmail;
  final String responderNGOWebsite;
  final DateTime respondNGOTime;

  NGO_Response_Registration({
    required this.respondId,
    required this.nid,
    required this.responderNGOName,
    required this.responderNGORegNo,
    required this.responderNGOAddress,
    required this.responderNGOContactNo,
    required this.responderNGOEmail,
    required this.responderNGOWebsite,
    DateTime? respondNGOTime,
  }) : respondNGOTime = respondNGOTime ?? DateTime.now();

  Map<String, dynamic> toNGORespondJson() {
    return {
      'RespondId': respondId,
      'nid': nid,
      'ResponderNGOName': responderNGOName,
      'ResponderNGORegNo': responderNGORegNo,
      'ResponderNGOAddress': responderNGOAddress,
      'ResponderNGOContactNumber': responderNGOContactNo,
      'ResponderNGOEmail': responderNGOEmail,
      'ResponderNGOWebsite': responderNGOWebsite,
      'RespondNGOTime': respondNGOTime.toString(),
    };
  }
}

class Govt_Response_Registration {
  final String respondId;
  final String gid;
  final String responderGovtName;
  final String responderGovtRegNo;
  final String responderGovtAddress;
  final String? responderGovtContactNo;
  final String responderGovtEmail;
  final String responderGovtWebsite;
  final DateTime respondGovtTime;

  // final String deviceToken;

  Govt_Response_Registration({
    required this.respondId,
    required this.gid,
    required this.responderGovtName,
    required this.responderGovtRegNo,
    required this.responderGovtAddress,
    required this.responderGovtContactNo,
    required this.responderGovtEmail,
    required this.responderGovtWebsite,
    // required this.deviceToken,
    DateTime? respondGovtTime,
  }) : respondGovtTime = respondGovtTime ?? DateTime.now();

  Map<String, dynamic> toGovtRespondJson() {
    return {
      'RespondId': respondId,
      'gid': gid,
      'ResponderGovtName': responderGovtRegNo,
      'ResponderGovtRegNo': responderGovtRegNo,
      'ResponderGovtAddress': responderGovtAddress,
      'ResponderGovtContactNumber': responderGovtContactNo,
      'ResponderGovtEmail': responderGovtEmail,
      'ResponderGovtWebsite': responderGovtWebsite,
      'RespondGovtTime': respondGovtTime.toString(),
    };
  }
}


// class Combined_Response {
//   final String respondId;
//   final String responderNGOName;
//   final String responderNGORegNo;
//   final String responderNGOAddress;
//   final String? responderNGOContactNo;
//   final String responderNGOEmail;
//   final String responderNGOWebsite;
//   final DateTime respondNGOTime;
//   final String responderGovtName;
//   final String responderGovtRegNo;
//   final String responderGovtAddress;
//   final String? responderGovtContactNo;
//   final String responderGovtEmail;
//   final String responderGovtWebsite;
//   final DateTime respondGovtTime;
//
//   Combined_Response({
//     required this.respondId,
//     required this.responderNGOName,
//     required this.responderNGORegNo,
//     required this.responderNGOAddress,
//     required this.responderNGOContactNo,
//     required this.responderNGOEmail,
//     required this.responderNGOWebsite,
//     required this.respondNGOTime,
//     required this.responderGovtName,
//     required this.responderGovtRegNo,
//     required this.responderGovtAddress,
//     required this.responderGovtContactNo,
//     required this.responderGovtEmail,
//     required this.responderGovtWebsite,
//     required this.respondGovtTime,
//   });
//
//   // Factory constructor to create Combined_Response from NGO_Response_Registration
//   factory Combined_Response.fromNGO(NGO_Response_Registration ngoResponse) {
//     return Combined_Response(
//       respondId: ngoResponse.respondId,
//       responderNGOName: ngoResponse.responderNGOName,
//       responderNGORegNo: ngoResponse.responderNGORegNo,
//       responderNGOAddress: ngoResponse.responderNGOAddress,
//       responderNGOContactNo: ngoResponse.responderNGOContactNo,
//       responderNGOEmail: ngoResponse.responderNGOEmail,
//       responderNGOWebsite: ngoResponse.responderNGOWebsite,
//       respondNGOTime: ngoResponse.respondNGOTime,
//       responderGovtName: '',
//       responderGovtRegNo: '',
//       responderGovtAddress: '',
//       responderGovtContactNo: '',
//       responderGovtEmail: '',
//       responderGovtWebsite: '',
//       respondGovtTime: DateTime.now(),
//     );
//   }
//
//   // Factory constructor to create Combined_Response from Govt_Response_Registration
//   factory Combined_Response.fromGovt(Govt_Response_Registration govtResponse) {
//     return Combined_Response(
//       respondId: govtResponse.respondId,
//       responderNGOName: '',
//       responderNGORegNo: '',
//       responderNGOAddress: '',
//       responderNGOContactNo: '',
//       responderNGOEmail: '',
//       responderNGOWebsite: '',
//       respondNGOTime: DateTime.now(),
//       responderGovtName: govtResponse.responderGovtName,
//       responderGovtRegNo: govtResponse.responderGovtRegNo,
//       responderGovtAddress: govtResponse.responderGovtAddress,
//       responderGovtContactNo: govtResponse.responderGovtContactNo,
//       responderGovtEmail: govtResponse.responderGovtEmail,
//       responderGovtWebsite: govtResponse.responderGovtWebsite,
//       respondGovtTime: govtResponse.respondGovtTime,
//     );
//   }
//
//   // Convert Combined_Response to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'RespondId': respondId,
//       'ResponderNGOName': responderNGOName,
//       'ResponderNGORegNo': responderNGORegNo,
//       'ResponderNGOAddress': responderNGOAddress,
//       'ResponderNGOContactNumber': responderNGOContactNo,
//       'ResponderNGOEmail': responderNGOEmail,
//       'ResponderNGOWebsite': responderNGOWebsite,
//       'RespondNGOTime': respondNGOTime.toString(),
//       'ResponderGovtName': responderGovtName,
//       'ResponderGovtRegNo': responderGovtRegNo,
//       'ResponderGovtAddress': responderGovtAddress,
//       'ResponderGovtContactNumber': responderGovtContactNo,
//       'ResponderGovtEmail': responderGovtEmail,
//       'ResponderGovtWebsite': responderGovtWebsite,
//       'RespondGovtTime': respondGovtTime.toString(),
//     };
//   }
// }


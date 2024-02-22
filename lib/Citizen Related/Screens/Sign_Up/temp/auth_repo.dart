// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
//
// // ignore: camel_case_types
// class Authentication_Repo extends GetxController {
//   static Authentication_Repo get instance => Get.find();
//
//   final _auth = FirebaseAuth.instance;
//   var verificationId = ''.obs;
//
//   //
//   Future<void> phoneAuthentication(String phoneNo) async {
//     await _auth.verifyPhoneNumber(
//       phoneNumber: phoneNo,
//       verificationCompleted: (credential) async {
//         await _auth.signInWithCredential(credential);
//       },
//       codeSent: (verificationId, resendToken) {
//         this.verificationId.value = verificationId;
//       },
//       codeAutoRetrievalTimeout: (verificationId) {
//         this.verificationId.value = verificationId;
//       },
//       verificationFailed: (e) {
//         if (e.code == 'invalid-phone-number') {
//           Get.snackbar('Error', 'The provided phone number is not valid ');
//         } else {
//           Get.snackbar('Error', 'Something went wrong ');
//         }
//       },
//     );
//   }
//
//
//   //
//   Future<bool> verifyOTP(String otp) async {
//     var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(
//         verificationId: verificationId.value, smsCode: otp));
//     return credentials.user != null ? true : false;
//   }
// }

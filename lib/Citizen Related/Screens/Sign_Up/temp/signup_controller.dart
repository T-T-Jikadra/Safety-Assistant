// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'auth_repo.dart';
//
// class SignUpController extends GetxController {
//   static SignUpController get instance => Get.find();
//
// //TextField Controllers to get data from TextFields
//
//   final phoneNo = TextEditingController();
//
// //Call these Functions from Design & they will do the logic
// //   void registerUser (String email, String password) {
// //     String? error = Authentication_Repo.instance.createUserWithEmailAndPassword(email, password) as String?;
// //     if (error != null) {
// //       Get.showSnackbar (GetSnackBar (message: error.toString()));
// //     }
// //   }
// //Get phoneNo from user and pass it to Auth Repository for Firebase Authentication
//   void phoneAuthentication(String phoneNo) {
//     Authentication_Repo.instance.phoneAuthentication(phoneNo);
//   }
// }

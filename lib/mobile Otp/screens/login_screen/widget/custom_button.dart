import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final clickOnLogin;

  // ignore: sort_constructors_first
  const CustomButton(this.clickOnLogin, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: ElevatedButton(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen()));
                clickOnLogin(context);
              },
              child: const Text("Proceed .."))),
    );
  }
}

// GestureDetector(
// onTap: () {
// verifyOtp();
// },
// child: Container(
// margin: const EdgeInsets.all(8),
// height: 45,
// width: double.infinity,
// decoration: BoxDecoration(
// color: const Color.fromARGB(255, 253, 188, 51),
// borderRadius: BorderRadius.circular(36),
// ),
// alignment: Alignment.center,
// child: const Text(
// 'Verify',
// style: TextStyle(color: Colors.black, fontSize: 16.0),
// ),
// ),
// ),
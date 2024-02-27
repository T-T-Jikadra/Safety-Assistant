import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Utils/constants.dart';
import 'ngo_signup.dart';

// ignore: must_be_immutable
class NGOLoginPageScreen extends StatefulWidget {
  const NGOLoginPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<NGOLoginPageScreen> createState() => _NGOLoginPageScreenState();
}

class _NGOLoginPageScreenState extends State<NGOLoginPageScreen> {
  TextEditingController loginRegNoTextController = TextEditingController();
  TextEditingController loginPwdTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool _obscurePwdText = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                const SizedBox(height: 41),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      padding: EdgeInsets.only(
                          //for fields that are covered under keyboard
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                          left: 16,
                          right: 16),
                      child: Column(
                        children: [
                          const Text(
                            "Log In to Continue : ",
                            style: TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 30),
                          // const Text("By logging In First !"),
                          const SizedBox(height: 50),
                          SvgPicture.asset(svg_for_login,
                              height: 200, width: 200),
                          const SizedBox(height: 45),
                          //ngo reg no
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              focusNode: _lastNameFocusNode,
                              controller: loginRegNoTextController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.app_registration,
                                    color: Colors.deepPurple),
                                hintText: "Enter registration no. of an NGO",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                                filled: true,
                                // fillColor: Colors.deepPurple,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Registration No';
                                }
                                if (value.isNotEmpty && value.length < 3) {
                                  return 'Minimum 3 Characters required';
                                }
                                return null; // Return null if the input is valid
                              },

                            ),
                          ),
                          const SizedBox(height: 30),
                          //pwd
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              controller: loginPwdTextController,
                              obscureText: _obscurePwdText,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.deepPurple,
                                ),
                                hintText: "Enter Password",
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscurePwdText = !_obscurePwdText;
                                    });
                                  },
                                  child: Icon(
                                    _obscurePwdText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              validator: _validatePassword,
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 28),
                    width: double.infinity,
                    child: ClipRRect(
                        // borderRadius: BorderRadius.circular(50),
                        child: ElevatedButton(
                            onPressed: () async {
                              //Circular Progress Bar
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return const Center(
                                    child: CircularProgressIndicator(color: Colors.white),
                                  );
                                },
                              );
                              await Future.delayed(const Duration(milliseconds: 800));
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, you can proceed with form submission
                                // For example, you can save the form data or navigate to the next screen
                                // If you need to access the form field values, you can use the controller
                                // For example: fnameTextController.text
                              }
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)))),
                            child: const Text("Continue"))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Don't have an Account ? ",
                      ),
                      SizedBox(
                        height: 35,
                        width: 120,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const NGOSignupPageScreen(),
                                          ));
                                    },
                                    child: const Text(
                                      "Sign Up First ! ..",
                                      // selectionColor: Colors.blueGrey,
                                    ))),
                            SvgPicture.asset(svg_for_line, width: 110),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null; // Return null if the password passes all validations
  }

}

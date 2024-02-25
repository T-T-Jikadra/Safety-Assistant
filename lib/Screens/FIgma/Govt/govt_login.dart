import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Utils/constants.dart';
import 'govt_signup.dart';

// ignore: must_be_immutable
class GovtLoginPageScreen extends StatefulWidget {
  const GovtLoginPageScreen({Key? key})
      : super(
    key: key,
  );

  @override
  State<GovtLoginPageScreen> createState() => _GovtLoginPageScreenState();
}

class _GovtLoginPageScreenState extends State<GovtLoginPageScreen> {
  TextEditingController regNoTextController = TextEditingController();
  TextEditingController pwdTextController = TextEditingController();

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
                const SizedBox(height: 75),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const Text(
                            "Start Serving ( Govt ) :",
                            style: TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            "By logging In First !",
                          ),
                          const SizedBox(height: 50),
                          SvgPicture.asset(svg_for_login,
                              height: 200, width: 200),
                          const SizedBox(height: 45),
                          //ngo reg no
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              focusNode: _lastNameFocusNode,
                              controller: regNoTextController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.app_registration,
                                    color: Colors.deepPurple),
                                hintText: "Registration No.",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                                filled: true,
                                // fillColor: Colors.deepPurple,
                              ),
                              // validator: (value){
                              //   if (value == null || value.isEmpty) {
                              //     FocusScope.of(context).requestFocus(_lastNameFocusNode);
                              //
                              //     return 'Please enter last name';
                              //
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                          const SizedBox(height: 30),
                          //pwd
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              controller: pwdTextController,
                              obscureText: _obscurePwdText,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.deepPurple,
                                ),
                                hintText: "Password",
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
                  padding: const EdgeInsets.only(right: 7, left: 7),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 28),
                    width: double.infinity,
                    child: ClipRRect(
                      // borderRadius: BorderRadius.circular(50),
                        child: ElevatedButton(
                            onPressed: () {
                              // Navigate based on selected role
                              final snackBar = SnackBar(
                                dismissDirection: DismissDirection.vertical,
                                elevation: 35,
                                padding: const EdgeInsets.all(7),
                                content: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Under Construction..'),
                                ),
                                duration: const Duration(seconds: 3),
                                // Duration for which SnackBar will be visible
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    // Undo functionality
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(18)))),
                            child: const Text("Continue .."))),
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
                                            const GovtSignupPageScreen(),
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
}

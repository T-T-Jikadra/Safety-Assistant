//import 'package:csc_picker/csc_picker.dart';
import 'package:fff/Citizen%20Related/Screens/sing_in_screen.dart';
import 'package:fff/Screens/entry_point.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:intl/intl.dart';

import '../../Components/common_background.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  // bool isSignUpDailog = false;
  bool checkboxValue = false;
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _dateinput = TextEditingController();
  final TextEditingController _address = TextEditingController();

  // final TextEditingController _city = TextEditingController();
  // final TextEditingController _code = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();

    return Scaffold(
      body: Stack(
        children: [
          const commonbg(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 25, left: 60, top: 70),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 54, fontFamily: "Poppins"),
                        ),
                      ),
                      const Text(
                        "Name :",
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 55,
                            width: 145,
                            child: TextFormField(
                              controller: _fname,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Name";
                                }
                                return null;
                              },
                              onSaved: (fname) {},
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(fontSize: 10),
                                hintText: 'Abc',
                                hintStyle: TextStyle(fontSize: 12),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: 55,
                            width: 145,
                            child: TextFormField(
                              controller: _lname,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Last Name";
                                }
                                return null;
                              },
                              onSaved: (sname) {},
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(fontSize: 10),
                                hintText: 'Patel',
                                hintStyle: TextStyle(fontSize: 12),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      SizedBox(
                        height: 55,
                        width: 240,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Date is Not Selected";
                            }
                            return null;
                          },
                          controller: _dateinput,
                          decoration: const InputDecoration(
                              errorStyle: TextStyle(fontSize: 10),
                              icon: Text("Birthdate :"), //icon of text field
                              hintText: "01/01/2000",
                              hintStyle: TextStyle(fontSize: 13)),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              if (kDebugMode) {
                                print(pickedDate);
                              }
                              String formattedDate =
                                  DateFormat('MM-dd-yyyy').format(pickedDate);
                              if (kDebugMode) {
                                print(formattedDate);
                              }

                              setState(() {
                                _dateinput.text = formattedDate;
                              });
                            } else {
                              if (kDebugMode) {
                                print("Date is not selected");
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Gender :",
                            style: TextStyle(color: Colors.black),
                          ),
                          getWidget(false, false),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Address :-",
                        style: TextStyle(color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 16),
                        child: TextFormField(
                          controller: _address,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your address";
                            }
                            return null;
                          },
                          onSaved: (email) {},
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(fontSize: 10),
                            hintText: "Address",
                            hintStyle: const TextStyle(fontSize: 13),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: SvgPicture.asset("assets/icons/email.svg"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        children: [
                          Text(
                            "State:",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 130,
                          ),
                          Text(
                            "City:",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      const Row(
                          // country picker
                          ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Email:-",
                        style: TextStyle(color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 16),
                        child: TextFormField(
                          controller: _email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }
                            return null;
                          },
                          onSaved: (email) {},
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(fontSize: 10),
                            hintText: "abc@gmail.com",
                            hintStyle: const TextStyle(fontSize: 13),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: SvgPicture.asset("assets/icons/email.svg"),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Already Have An Account?",
                            style: TextStyle(fontSize: 12),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const SignInScreen()));
                            },
                            child: const Text(
                              "Sign In!",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      FormField<bool>(
                        builder: (state) {
                          return Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                      value: checkboxValue,
                                      onChanged: (value) {
                                        setState(() {
                                          checkboxValue = true;
                                          state.didChange(value);
                                        });
                                      }),
                                  const Text('I accept terms & Conditions'),
                                ],
                              ),
                              Text(
                                state.errorText ?? '',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              )
                            ],
                          );
                        },
                        validator: (value) {
                          if (!checkboxValue) {
                            return 'You need to accept terms & conditions';
                          } else {
                            return null;
                          }
                        },
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const EntryPoint()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF77D8E),
                          minimumSize: const Size(double.infinity, 56),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                        ),
                        icon: const Icon(
                          CupertinoIcons.arrow_right,
                          color: Color(0xFFFE0037),
                        ),
                        label: const Text("Sign In"),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getWidget(bool showOtherGender, bool alignVertical) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: SizedBox(
        height: 36,
        width: 240,
        child: GenderPickerWithImage(
          showOtherGender: showOtherGender,
          verticalAlignedText: alignVertical,
          // to show what's selected on app opens, but by default it's Male
          selectedGender: Gender.Male,
          selectedGenderTextStyle: const TextStyle(
              color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
          unSelectedGenderTextStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal),
          onChanged: (Gender? gender) {
            if (kDebugMode) {
              print(gender);
            }
          },
          //Alignment between icons
          equallyAligned: true,
          animationDuration: const Duration(milliseconds: 300),
          isCircular: true,
          // default : true,
          opacityOfGradient: 0.4,
          size: 50, //default : 40
        ),
      ),
    );
  }
}

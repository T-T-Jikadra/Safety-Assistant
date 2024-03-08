// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'package:fff/Utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Citizen Related/Screens/citizen_login_screen/otp_screen.dart';
import '../../Components/Check for Internet/check_internet.dart';
import '../../Govt Body Related/Screens/govt_home_screen/home_screen_govt.dart';
import '../../NGO Related/Screens/ngo_home_screen/home_screen_ngo.dart';
import '../../Utils/themes/theme.dart';
import '../../Citizen Related/Screens/citizen_home_screen/home_screen_citizen.dart';
import '../onBoarding/onBoard.dart';

// ignore: camel_case_types
class splash extends StatelessWidget {
  const splash({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return GetMaterialApp(
      //title:'CAS',
      navigatorKey: navigatorKey, // Set the global navigator key
      title: 'Citizen Emergency & response system',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      initialRoute: '/',
      // Set the initial route to '/'

      //Paths of the screens in key value pair ..
      routes: <String, WidgetBuilder>{
        '/otpScreen': (BuildContext ctx) => OtpScreen(),
        '/liquidpages': (BuildContext ctx) => const liquidpages(),
        '/homeScreen': (BuildContext ctx) => const CitizenHomeScreen(),
        '/GovtHomeScreen': (BuildContext ctx) => const GovtHomeScreen(),
        '/NGOHomeScreen': (BuildContext ctx) => const NGOHomeScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  String? finalUserType = "";

  @override
  void initState() {
    super.initState();
    startAnimationIn().whenComplete(() async {
      Timer(const Duration(milliseconds: 5),
          () => navigateToPageBasedOnUserType(finalUserType));
    });
    InternetPopup().initialize(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //1st object on the top left corner ..
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: animate ? 15 : -60,
            left: animate ? 20 : -60,
            height: 130,
            width: 130,
            child: Container(
              //color: Colors.teal,
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(600),
                      topLeft: Radius.circular(320),
                      bottomLeft: Radius.circular(230),
                      topRight: Radius.circular(200)),
                  color: Colors.teal),
            ),
          ),
          //2nd object as a 2 texts
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 135,
              left: animate ? 100 : -10,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: animate ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "It's Splash Screen",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              )),
          //3rd object as an image
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              bottom: animate ? 150 : 0,
              height: 450,
              width: 350,
              child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: animate ? 1 : 0,
                  child: SvgPicture.asset(splash_svg))),
          //4th small object at bottom ..
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            bottom: animate ? 40 : 0,
            right: 30,
            // height: 450,
            // width: 350,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1600),
              opacity: animate ? 1 : 0,
              child: Container(
                //color: Colors.teal,
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(100),
                        topLeft: Radius.circular(120),
                        bottomLeft: Radius.circular(30),
                        topRight: Radius.circular(290)),
                    color: Colors.teal),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //function for animation
  Future startAnimationIn() async {
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 2700));
    setState(() {
      animate = false;
    });
    await Future.delayed(const Duration(milliseconds: 900));

    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var obtainedUserType = sharedPref.getString("userType");
    setState(() {
      finalUserType = obtainedUserType;
    });

    // FirebaseAuth auth = FirebaseAuth.instance;
    // User? user = auth.currentUser;
    //String? emailOfUser = auth.currentUser!.email;

    // if (user != null) {
    //   // User is signed in.
    //   // Navigate to the home screen.
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const GovtHomeScreen(),
    //       ));
    //   //CitizenHomeScreen
    // } else {
    //   // User is not signed in.
    //   // Navigate to the login screen.
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const liquidpages(),
    //       ));
    // }
  }

  void navigateToPageBasedOnUserType(String? userType) {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (userType == "NGO") {
      Get.offAll(() => const NGOHomeScreen());
    } else if (userType == "Govt") {
      // Navigate to Government screen
      Get.offAll(() => const GovtHomeScreen());
    } else if (userType == "Citizen") {
      //user is not null (has some value)
      if (user != null) {
        //String? userEmail = auth.currentUser!.email;
        String? phone = auth.currentUser!.phoneNumber;
        if (kDebugMode) {
          print("citizen phone : ");
        }
        if (kDebugMode) {
          print(phone);
        }
        // Navigate to Citizen screen
        Get.offAll(() => const CitizenHomeScreen());
      }
    } else {
      Get.offAll(() => const liquidpages());

      // Handle invalid userType
      if (kDebugMode) {
        print("Invalid userType: $userType");
      }
    }
  }

  Future<void> checkUSerState() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    //user is not null (has some value)
    if (user != null) {
      String? userEmail = auth.currentUser!.email;
      String? phone = auth.currentUser!.phoneNumber;
      if (kDebugMode) {
        print("citizen phone : ");
      }
      if (kDebugMode) {
        print(phone);
      }

      if (kDebugMode) {
        print("user is : $user");
      }
      //email is not null
      if (userEmail != null) {
      } else {
        // User is signed in. Navigate to the home screen.
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CitizenHomeScreen(),
            ));
        //CitizenHomeScreen
      }
    } else {
      if (kDebugMode) {
        print("user is null :( ");
      }

      // User is not signed in. Navigate to the login screen.
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const liquidpages(),
          ));
    }
  }

//function for animation
// Future startAnimationOut() async {
//   await Future.delayed(const Duration(milliseconds: 500));
//   setState(() {
//     animate = true;
//   });
// }
}

import 'package:fff/onBoarding/onBoard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../src/utils/themes/theme.dart';

// ignore: camel_case_types
class splash extends StatelessWidget {
  const splash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAS',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.LightTheme,
      darkTheme: TAppTheme.DarkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
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

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //1st object on the top left corner ..
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: animate ? 15 : -30,
              left: animate ? 20 : -30,
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
                  child: SvgPicture.asset("assets/svg/splash_svg.svg")
                )),
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
      ),
    );
  }

  //function for animation
  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 5000));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const liquidpages(),
        ));
  }
}

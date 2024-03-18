// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Components/check_for_internet/check_internet.dart';
import '../../Utils/themes/theme.dart';
import '../type of user/select_user_type_screen.dart';


class LiquidPages extends StatelessWidget {
  const LiquidPages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAS',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const liquidpages(),
    );
  }
}

// ignore: camel_case_types
class liquidpages extends StatefulWidget {
  const liquidpages({super.key});

  @override
  State<liquidpages> createState() => _liquidpagesState();
}

// ignore: camel_case_types
class _liquidpagesState extends State<liquidpages> {
  final lController = LiquidController();
  int currentPage = 0;

  @override
  //initState method
  void initState() {
    // TODO: implement initState
    super.initState();
    //for internet connection checkup
  }

  @override
  Widget build(BuildContext context) {
    InternetPopup().initialize(context: context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text("Hello,"),
          LiquidSwipe(
            liquidController: lController,
            onPageChangeCallback: onPageChnagedCallback,
            pages: [
              //1st
              Container(
                padding: const EdgeInsets.all(10),
                //color: Colors.white,
                color: const Color(0xFFffebcd),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                        image: const AssetImage(
                            "assets/images/electricity_user_1.jpg"),
                        height: size.height * 0.5),
                    const Column(
                      children: [
                        Text("Think Beyond Limit ...",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Explore now ...",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                    const Text("1/4 ...",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
              //2nd
              Container(
                padding: const EdgeInsets.all(10),
                //color: Colors.green,
                color: const Color(0xFFaaf0d1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Lottie.asset("assets/json/otp_lottie.json",
                          //width: 250,
                          height: size.height * 0.5,
                          fit: BoxFit.fitWidth),
                    )
                    // ,Image(
                    //     image: const AssetImage("i mg/ss.png"),
                    //     height: size.height * 0.5),
                    ,
                    const Column(
                      children: [
                        Text("Customise Your Stuffs ...",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        SizedBox(
                          height: 15,
                        ),
                        Text("As your thinking capability ...",
                            style:
                                TextStyle(color: Colors.black, fontSize: 14)),
                      ],
                    ),
                    const Text("2/4 ..",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
              //3rd
              Container(
                padding: const EdgeInsets.all(10),
                //color: Colors.blueGrey,
                color: const Color(0xFFe9969a),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset("assets/svg/services_help.svg"),
                    ),
                    const Column(
                      children: [
                        Text("Thing Beyond Limit ...",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Explore now ...",
                            style:
                                TextStyle(color: Colors.black, fontSize: 14)),
                      ],
                    ),
                    const Text("3/4 ...",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
              //4th
              Container(
                color: const Color(0xFFd3d3d3),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: SvgPicture.asset("assets/svg/services_help.svg"),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Text("4/4 ...",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ],
                ),
              ),
              //5th
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue, Colors.white],
                  ),
                ),
              ),
            ],
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            fullTransitionValue: 750,
            preferDragFromRevealedArea: true,
            //waveType: WaveType.circularReveal,
            //disableUserGesture: true,
          ),

          //Round button
          Positioned(
              bottom: 55,
              child: OutlinedButton(
                onPressed: () {
                  int nextPage = lController.currentPage + 1;
                  lController.animateToPage(page: nextPage);
                  if (nextPage == 5) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectOptionPageScreen()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.black26),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              )),
          //skip text button
          Positioned(
              top: 40,
              right: 20,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectOptionPageScreen()),
                  );
                  //lController.jumpToPage(page: 2);
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.black54),
                ),
              )),
          // 5 dots
          Positioned(
              bottom: 20,
              child: AnimatedSmoothIndicator(
                activeIndex: lController.currentPage,
                count: 5,
                effect: const WormEffect(
                    activeDotColor: Colors.black, dotHeight: 5.0),
              ))
        ],
      ),
    ));
  }

  void onPageChnagedCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}

import 'package:fff/Notification_related/message_screen.dart';
import 'package:fff/Screens/Splash/splash_Screen.dart';
import 'package:fff/Screens/entry_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Components/Check for Internet/check_internet.dart';
import '../Notification_related/notification_services.dart';
import '../src/utils/themes/theme.dart';

class LiquidPages extends StatelessWidget {
  const LiquidPages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAS',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.LightTheme,
      darkTheme: TAppTheme.DarkTheme,
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
  NotificationServices notificationServices = NotificationServices();

  @override
  //initState method
  void initState() {
    // TODO: implement initState
    super.initState();
    //for internet connection checkup
    InternetPopup().initialize(context: context);
  }

  @override
  Widget build(BuildContext context) {
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
                        image: const AssetImage("assets/images/img.png"),
                        height: size.height * 0.5),
                    Column(
                      children: [
                        Text("Think Beyond Limit ...",
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Explore now ...",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Text("1/3 ...",
                        style: Theme.of(context).textTheme.titleLarge),
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
                      child: Lottie.asset("assets/json/lt.json",
                          //width: 250,
                          height: size.height * 0.5,
                          fit: BoxFit.fitWidth),
                    )
                    // ,Image(
                    //     image: const AssetImage("i mg/ss.png"),
                    //     height: size.height * 0.5),
                    ,
                    Column(
                      children: [
                        Text("Customise Your Stuffs ...",
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("As your thinking capability ...",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    Text(
                      "2/3 ..",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
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
                      child: Image(
                          image:
                              const AssetImage("assets/images/img_image_1.png"),
                          height: size.height * 0.5),
                    ),
                    Column(
                      children: [
                        Text("Thing Beyond Limit ...",
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Explore now ...",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    Text("3/3 ...",
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
              //4th
              Container( color: const Color(0xFFd3d3d3 ),),
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
                          builder: (context) => const entry()),
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
                        builder: (context) => const entry()),
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

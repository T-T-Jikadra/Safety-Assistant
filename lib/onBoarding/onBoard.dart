import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Components/Check for Internet/check_internet.dart';
import '../Notification_related/message_screen.dart';
import '../Notification_related/notification_services.dart';


class LiquidPages extends StatelessWidget {
  const LiquidPages({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: liquidpages(),
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
    InternetPopup().initialize(context: context);
  }
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
                    color: Colors.white,
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
                    color: Colors.green,
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
                    color: Colors.blueGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Image(
                              image: const AssetImage("assets/images/img_image_1.png"),
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
                  Container(color: Colors.blue),
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
                  if (nextPage == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MessageScreen()),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MessageScreen(),
                      ));
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

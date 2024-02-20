import 'dart:math';
import 'package:fff/Citizen%20Related/Components/menu.dart';
import 'package:fff/Citizen%20Related/Components/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:fff/Components/common_background.dart';
import '../models/menu_btn.dart';
import '../src/utils/themes/theme.dart';
import '../utills/constants.dart';

// ignore: camel_case_types
class entry extends StatelessWidget {
  const entry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAS',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.LightTheme,
      darkTheme: TAppTheme.DarkTheme,
      themeMode: ThemeMode.system,
      home: const EntryPoint(),
    );
  }
}

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  bool isSideBarOpen = false;

  //Menu selectedBottomNav = bottomNavItems.first;
  Menu selectedSideMenu = sidebarMenus.first;

  late SMIBool isMenuOpenInput;

  List<dynamic> pages = [];

  // void updateSelectedBtmNav(Menu menu) {
  //   if (selectedBottomNav != menu) {
  //     setState(() {
  //       selectedBottomNav = menu;
  //     });
  //   }
  // }

  late AnimationController _animationController;
  late Animation<double> scalAnimation;
  late Animation<double> animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
        () {
          setState(() {});
        },
      );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColorLight,
      body: Stack(
        children: [
          //To show the drawer
          AnimatedPositioned(
            width: 288,
            height: MediaQuery.of(context).size.height,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? 0 : -288,
            top: 0,
            child: const SideBar(),
          ),
          //To show the moving background
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(
                  1 * animation.value - 30 * (animation.value) * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scalAnimation.value,
                child: const ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                  child: commonbg(),
                ),
              ),
            ),
          ),
          //to move and animate the drawer opening icon
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideBarOpen ? 220 : 05,
            top: 05,
            child: MenuBtn(
              press: () {
                isMenuOpenInput.value = !isMenuOpenInput.value;

                if (_animationController.value == 0) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                  Menu selectedSideMenu = sidebarMenus.first;
                }

                setState(
                  () {
                    isSideBarOpen = !isSideBarOpen;
                  },
                );
              },
              riveOnInit: (artboard) {
                final controller = StateMachineController.fromArtboard(
                    artboard, "State Machine");

                artboard.addController(controller!);

                isMenuOpenInput =
                    controller.findInput<bool>("isOpen") as SMIBool;
                isMenuOpenInput.value = true;
              },
            ),
          ),
        ],
      ),
      //bottom navigation
      // bottomNavigationBar: Transform.translate(
      //   offset: Offset(0, 100 * animation.value),
      //   child: SafeArea(
      //     child: Container(
      //       padding:
      //           const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
      //       margin: const EdgeInsets.symmetric(horizontal: 24),
      //       decoration: BoxDecoration(
      //         color: backgroundColor2.withOpacity(0.8),
      //         borderRadius: const BorderRadius.all(Radius.circular(24)),
      //         boxShadow: [
      //           BoxShadow(
      //             color: backgroundColor2.withOpacity(0.3),
      //             offset: const Offset(0, 20),
      //             blurRadius: 20,
      //           ),
      //         ],
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           ...List.generate(
      //             bottomNavItems.length,
      //             (index) {
      //               Menu navBar = bottomNavItems[index];
      //               return BtmNavItem(
      //                 navBar: navBar,
      //                 press: () {
      //                   RiveUtils.chnageSMIBoolState(navBar.rive.status!);
      //                   updateSelectedBtmNav(navBar);
      //                   if (kDebugMode) {
      //                     print(index);
      //                   }
      //                   if (index == 1) {
      //                     Navigator.of(context).push(MaterialPageRoute(
      //                       builder: (context) => (const SingUpScreen()),
      //                     ));
      //                   }
      //                   else if (index == 2) {
      //                     Navigator.of(context).push(MaterialPageRoute(
      //                       builder: (context) => const MessageScreen(),
      //                     ));
      //                   }
      //                 },
      //                 riveOnInit: (artboard) {
      //                   navBar.rive.status = RiveUtils.getRiveInput(artboard,
      //                       stateMachineName: navBar.rive.stateMachineName);
      //                 },
      //                 selectedNav: selectedBottomNav,
      //               );
      //             },
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

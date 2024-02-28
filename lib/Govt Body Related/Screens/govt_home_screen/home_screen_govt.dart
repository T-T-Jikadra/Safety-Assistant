import 'dart:math';
import 'package:fff/Govt%20Body%20Related/Screens/govt_home_screen/common_background_govt.dart';
import 'package:fff/Govt%20Body%20Related/Screens/govt_home_screen/side_bar_govt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import '../../../models/menu_btn.dart';
import '../../../Utils/constants.dart';
import 'menu_govt.dart';

// class entry extends StatelessWidget {
//   const entry({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'CAS',
//       debugShowCheckedModeBanner: false,
//       theme: TAppTheme.lightTheme,
//       darkTheme: TAppTheme.darkTheme,
//       themeMode: ThemeMode.system,
//       home: const EntryPoint(),
//     );
//   }
// }

class GovtHomeScreen extends StatefulWidget {
  const GovtHomeScreen({super.key});

  @override
  State<GovtHomeScreen> createState() => _GovtHomeScreenState();
}

class _GovtHomeScreenState extends State<GovtHomeScreen>
    with SingleTickerProviderStateMixin {
  bool isSideBarOpen = false;

  Menu_govt selectedSideMenu = sidebarMenus.first;

  late SMIBool isMenuOpenInput;

  List<dynamic> pages = [];

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
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundColorLight,
          body: GestureDetector(
            onTap: () {
              if (isSideBarOpen) {
                setState(() {
                  isSideBarOpen = false;
                });
                _animationController.reverse();
                // Trigger click event of MenuBtn
                // You can call the MenuBtn's press function here if it's accessible
              }
            },
            child: Stack(
              children: [
                //To show the drawer
                AnimatedPositioned(
                  width: 288,
                  height: MediaQuery.of(context).size.height,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                  left: isSideBarOpen ? 0 : -288,
                  top: 0,
                  child: const SideBar_govt(),
                ),
                //To show the moving background
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(1 * animation.value -
                        30 * (animation.value) * pi / 180),
                  child: Transform.translate(
                    offset: Offset(animation.value * 265, 0),
                    child: Transform.scale(
                      scale: scalAnimation.value,
                      child: const ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(24),
                        ),
                        child: commonbg_govt(),
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
                        //Menu selectedSideMenu = sidebarMenus.first;
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
          ),
        ),
      ),
    );
  }
}

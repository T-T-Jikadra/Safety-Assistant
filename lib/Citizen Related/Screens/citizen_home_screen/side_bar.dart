import 'package:fff/Citizen%20Related/Screens/citizen_home_screen/side_menu.dart';
import 'package:fff/Notification_related/message_screen.dart';
import 'package:fff/Utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../Utils/rive_utils.dart';
import '../../Screens/FAQ_screen.dart';
import '../../Screens/NGO-GA_list_screen.dart';
import '../../Screens/about_us_screen.dart';
import '../../Screens/donation_history_screen.dart';
import '../../Screens/req_history_screen.dart';
import '../../Screens/profile_screen.dart';
import '../../../Components/info_card.dart';
import 'menu.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Menu selectedSideMenu = sidebarMenus.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 288,
        height: double.infinity,
        decoration: const BoxDecoration(
          //color: Colors.blueGrey,
          //light purple
          //color: Color(0xFF9999db),
          //dark bluish
          color: Sidebar_BG,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => {
                  },
                  child: const InfoCard(
                    name: "TYBCA",
                    bio: "BAKCHODIANS",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                  child: Text(
                    "Browse".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70),
                  ),
                ),
                ...sidebarMenus
                    .map((menu) => SideMenu(
                          menu: menu,
                          selectedMenu: selectedSideMenu,

                          //on tap routes ..
                          press: () async {
                            RiveUtils.chnageSMIBoolState(menu.rive.status!);
                            setState(() {
                              selectedSideMenu = menu;
                            });
                            //extra (for testing only)
                            await Future.delayed(
                                const Duration(milliseconds: 500));

                            if (menu.title.contains("Home")) {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const msgScreen(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = const Offset(1.0, 0.0);
                                    var end = Offset.zero;
                                    var curve = Curves.ease;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            } else if (menu.title.contains("Profile")) {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const ProfileScreen(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = const Offset(1.0, 0.0);
                                    var end = Offset.zero;
                                    var curve = Curves.ease;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            } else if (menu.title.contains("NGO")) {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const NGO_GA_ListScreen(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = const Offset(1.0, 0.0);
                                    var end = Offset.zero;
                                    var curve = Curves.ease;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            } else if (menu.title.contains("Req")) {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const Request_History_Screen(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = const Offset(1.0, 0.0);
                                    var end = Offset.zero;
                                    var curve = Curves.ease;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            } else if (menu.title.contains("Donation")) {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const Donation_History_Screen(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = const Offset(1.0, 0.0);
                                    var end = Offset.zero;
                                    var curve = Curves.ease;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            }
                            //till above
                          },
                          riveOnInit: (artboard) {
                            menu.rive.status = RiveUtils.getRiveInput(artboard,
                                stateMachineName: menu.rive.stateMachineName);
                          },
                        ))
                    .toList(),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
                  child: Text(
                    "Others".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70),
                  ),
                ),
                ...sidebarMenus2
                    .map((menu) => SideMenu(
                          menu: menu,
                          selectedMenu: selectedSideMenu,
                          press: () async {
                            RiveUtils.chnageSMIBoolState(menu.rive.status!);
                            setState(() {
                              selectedSideMenu = menu;
                            });
                            await Future.delayed(
                                const Duration(milliseconds: 500));

                            if (menu.title.contains("FAQ")) {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const FAQScreen(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = const Offset(1.0, 0.0);
                                    var end = Offset.zero;
                                    var curve = Curves.ease;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            } else if (menu.title.contains("About")) {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const AboutUsScreen(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = const Offset(1.0, 0.0);
                                    var end = Offset.zero;
                                    var curve = Curves.ease;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            }else if (menu.title.contains("Logout")) {
                              // ignore: use_build_context_synchronously
                              //To logs out the current user ..
                              await FirebaseAuth.instance.signOut();
                              SystemNavigator.pop();
                            }
                          },
                          riveOnInit: (artboard) {
                            menu.rive.status = RiveUtils.getRiveInput(artboard,
                                stateMachineName: menu.rive.stateMachineName);
                          },
                        ))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

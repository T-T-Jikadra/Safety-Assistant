import 'package:fff/Admin%20Related/Lower%20Level%20Admin/lowerAdmin.dart';
import 'package:flutter/material.dart';

import '../onBoarding/onBoard.dart';


class AppRoutes {

  // ignore: constant_identifier_names
  static const String Lower_Admin = '/lowerAdmin.dart';

  //static const String splash = '/splash_page.dart';

  // ignore: constant_identifier_names
  static const String on_Boarding = '/onBoard.dart';

  //static const String splashScreen = '/splash_screen';

  static const String main = '/main.dart';

  static const String loginScreen = '/login_screen';

  static const String dashboardScreen = '/dashboard_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {

    Lower_Admin: (context) => const Ad_Lower(),

    on_Boarding: (context) => const LiquidPages(),

    //main: (context) => main(),



    //splashScreen: (context) => SplashScreen(),
    //regScreen: (context) => RegScreen(),
    //loginScreen: (context) => LoginScreen(),
    //dashboardScreen: (context) => DashboardScreen(),
    //appNavigationScreen: (context) => AppNavigationScreen()
  };
}

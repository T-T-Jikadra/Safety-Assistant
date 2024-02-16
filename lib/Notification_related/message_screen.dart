import 'package:fan_side_drawer/fan_side_drawer.dart';
import 'package:fff/Notification_related/show_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../src/utils/themes/theme.dart';
import 'navigate_to.dart';
import 'notification_services.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandle);
//   //runApp(const MessageScreen());
// }
//
// //top lvl function ...
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandle(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   if (kDebugMode) {
//     print(message.notification!.title.toString());
//   }
// }

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //For the themes functionalities as per the system .
      theme: TAppTheme.LightTheme,
      darkTheme: TAppTheme.DarkTheme,
      themeMode: ThemeMode.system,
      home: const msgScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: camel_case_types
class msgScreen extends StatefulWidget {
  const msgScreen({super.key});

  @override
  State<msgScreen> createState() => _msgScreenState();
}

// ignore: camel_case_types
class _msgScreenState extends State<msgScreen> {
  final nameController = TextEditingController();
  NotificationServices notificationServices = NotificationServices();

  @override
  //initState method
  void initState() {
    // TODO: implement initState
    super.initState();

    //at 12pm
    //NotificationServices().initLocalNotification(context, null); // Initialize local notifications

    //for notification permission pop up
    notificationServices.requestNotificationPermission();

    //for ...
    notificationServices.firebaseInit(context);

    //for  notification when background and terminated case of application
    notificationServices.setupInteractMessage(context);

    //for token refresh
    //notificationServices.isTokenRefresh();

    //for token mechanism
    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('Device token :');
        print(value);
      }
    });
  }

  List<DrawerMenuItem> get menuItems => [
        DrawerMenuItem(
            title: 'Home',
            icon: Icons.house_rounded,
            iconSize: 15,
            onMenuTapped: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShowDetails(msg: '123456789'),
                  ));
            }),
        DrawerMenuItem(
            title: 'Account Details',
            icon: Icons.account_circle_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Profile',
            icon: Icons.info_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Wallet',
            icon: Icons.wallet_rounded,
            iconSize: 15,
            onMenuTapped: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShowDetails(msg: '123456789'),
                  ));
            }),
        DrawerMenuItem(
            title: 'Transaactions',
            icon: Icons.attach_money_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Messages',
            icon: Icons.message_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Tickets',
            icon: Icons.support_agent_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Orders',
            icon: Icons.format_list_bulleted_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'App Settings',
            icon: Icons.adb_sharp,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Notifications',
            icon: Icons.alarm_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Subscribtion Plans',
            icon: Icons.question_answer_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Shops',
            icon: Icons.store,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Shops',
            icon: Icons.store,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Shops',
            icon: Icons.store,
            iconSize: 15,
            onMenuTapped: () {}),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 255,
        child: FanSideDrawer(
          drawerType: DrawerType.pipe,
          menuItems: menuItems,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Citizen Aided Services"),
      ),
      // appBar: AppBar(
      //   leading: const Icon(Icons.ac_unit_sharp),
      //   title: const Text('Landing Page'),
      //   elevation: 50,
      //   backgroundColor: Colors.black12,
      //   centerTitle: true,
      //   shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //           bottomRight: Radius.circular(25),
      //           bottomLeft: Radius.circular(25))),
      // ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const secondScreen(id: '3'),
                ));
          },
          child: const Text('Tap'),
        ),
      ),
    );
  }
}

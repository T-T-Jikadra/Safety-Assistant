import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Utils/themes/theme.dart';
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
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 50,
        backgroundColor: Colors.white24,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
        title: const Text("DMS"),
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

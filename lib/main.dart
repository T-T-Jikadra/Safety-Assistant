import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Notification_related/notification_services.dart';

//void main
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandle);
  runApp(const MyApp());
}

//top lvl function ...
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandle(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) {
    print(message.notification!.title.toString());
  }
}

//Stateful widget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

//Widget state
class _MyAppState extends State<MyApp> {

  final nameController = TextEditingController();
  NotificationServices notificationServices = NotificationServices();

  @override
  //initState method
  void initState() {
    // TODO: implement initState
    super.initState();

    //at 12pm
    NotificationServices()
        .initLocalNotification(context, null); // Initialize local notifications

    //for notification permission pop up
    notificationServices.requestNotificationPermission();

    //for ...
    notificationServices.firebaseInit();

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'add',
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    CollectionReference colRef =
                        FirebaseFirestore.instance.collection('client');
                    colRef.add({'name': nameController.text});
                  },
                  child: const Text("Add to database"))
            ],
          ),
        ),
      ),
    );
  }
}

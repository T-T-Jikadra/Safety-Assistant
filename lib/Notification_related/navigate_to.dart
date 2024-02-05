import 'dart:convert';

import 'package:flutter/material.dart';
import 'notification_services.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class secondScreen extends StatefulWidget {
  final String id;

  const secondScreen({super.key, required this.id});

  @override
  State<secondScreen> createState() => _secondScreenState();
}

// ignore: camel_case_types
class _secondScreenState extends State<secondScreen> {
  NotificationServices notificationServices = NotificationServices();

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('The information from the notification Is : - '),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                keyboardType: TextInputType.text,
                initialValue: widget.id,
                decoration:
                    const InputDecoration(prefixIcon: Icon(Icons.accessible)),
              ),
            ),
            // Text(widget.id,
            //     style: const TextStyle(
            //         color: Colors.lightBlue,
            //         fontSize: 30,
            //         fontWeight: FontWeight.bold)),
            TextButton(
                onPressed: () {
                  notificationServices.getDeviceToken().then((value) async {
                    var data = {
                      //token of the current device on which send notification
                      //token of Redmi 11s
                      //'to': 'fxbQs2E9SnSssjXKMEVbOT:APA91bEvI2C5QUAf2DHtZTIzYmqjUBFofyKztCOW1lF9iR-hGATlIsBfe94i_YCwW5eFe0PEzyXgy-X2E4hg3NStVUk0s9GOmiABe31ckLtGKrfGvKptis6FdM4j6gadbCkSN0EZiWJp',
                      'to': value.toString(),
                      'priority': 'high',
                      //shown details
                      'notification': {
                        'title': 'TT',
                        'body': 'Hemloow',
                      },
                      //
                      'android': {
                        'notification': {
                          'notification_count': 23
                        },
                      },
                      //passed data
                      'data': {'type': 'Temp', 'id': '1234567890'}
                    };
                    await http.post(
                        Uri.parse('https://fcm.googleapis.com/fcm/send'),
                        body: jsonEncode(data),
                        headers: {
                          'Content-Type': 'application/json; charset=UTF-8',
                          'Authorization':
                              'key=AAAAqhgqKGQ:APA91bEi_iwrEhn8BbQOG7pfFwUikl3Kp0K1sKAoOadF9Evb8Off1U5EqwljkoMprm5uO-aS_wctndIRoJum30YbvyJIBA5W4TF-EBmL8DRTrY1kHTTsDXaW8wWPLBSrbcgPobzzm8No'
                        });
                  });
                },
                child: const Text("Send Notification"))
          ],
        ),
      ),
    );
  }
}
import 'dart:convert';
import 'package:flutter/foundation.dart';
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
  TextEditingController txtControl = TextEditingController();
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('Device token signup : $value');
      }
      // Store the device token in the global variable
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('The information from the notification Is : - '),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: txtControl,
                keyboardType: TextInputType.text,
                //initialValue: widget.id,
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
                  // notificationServices.getDeviceToken().then((value) async {
                  //   var data = {
                  //     //token of the current device on which send notification
                  //     //token of Redmi 11s
                  //     //'to': 'diH2eMWdRv-v6tt3pO4lPA:APA91bHTwnPxE8sbeejiN5dK7xzcyR3uv9v_iM9ExCZ9r_oJu7GMw8MSO-QSX5oyIpG3hd3cNk42LJvlsJT50fG1UahMZxSc2pFI9lfauZFT3O90KDEu9tH6o5glznr_rpKC9iEFkq5r',
                  //     //10s
                  //     'to': 'd2VeiI14SPijdDYxyoAqll:APA91bGzi2QV-nQWA2yr6d_dAsBl1ouj6UeO_ajyLk4UwfJkXgoXCuYKC5PSISCPFTud1fl05KFTwTqQXxqUyqBjf7JkEpw03j7_VepL2yUeEWRcFNjIeFG747a5f_Qq8OLdHfA854-C',
                  //     //5g
                  //     //'to':'eOCtztseTY-sStK8pWjUyr:APA91bFcCFH7veaxwHNQmow9yzDwdoRYz6X8HuTvXa8TB_49CfahlrqO4u7oX1cUGZmMaZGTQa2N8-TCQQOdNnDo1pWZdgdFe4W8kjK33wy1zsKDyBfExZj2lFErIcOhUy7QkHQzggAj',
                  //
                  //     //'to': value.toString(),
                  //     'priority': 'high',
                  //     //shown details
                  //     'notification': {
                  //       'title': 'Alert!',
                  //       'body': txtControl.text
                  //       //'body': "It's Emergency Alert ...",
                  //     },
                  //     //
                  //     'android': {
                  //       'notification': {
                  //         'notification_count': 23
                  //       },
                  //     },
                  //     //passed data
                  //     'data': {
                  //       //'type': "It's Emergency Alert ...",
                  //       'type': "It's ${txtControl.text}",
                  //       'id': '1234567890'}
                  //   };
                  //   await http.post(
                  //       Uri.parse('https://fcm.googleapis.com/fcm/send'),
                  //       body: jsonEncode(data),
                  //       headers: {
                  //         'Content-Type': 'application/json; charset=UTF-8',
                  //         'Authorization':
                  //             'key=AAAAqhgqKGQ:APA91bEi_iwrEhn8BbQOG7pfFwUikl3Kp0K1sKAoOadF9Evb8Off1U5EqwljkoMprm5uO-aS_wctndIRoJum30YbvyJIBA5W4TF-EBmL8DRTrY1kHTTsDXaW8wWPLBSrbcgPobzzm8No'
                  //       });
                  // });
                  notificationServices.getDeviceToken().then((value) async {
                    var data = {
                      //token of the current device on which send notification
                      //token of Redmi 11s JD
                      //'to': 'diH2eMWdRv-v6tt3pO4lPA:APA91bHTwnPxE8sbeejiN5dK7xzcyR3uv9v_iM9ExCZ9r_oJu7GMw8MSO-QSX5oyIpG3hd3cNk42LJvlsJT50fG1UahMZxSc2pFI9lfauZFT3O90KDEu9tH6o5glznr_rpKC9iEFkq5r',
                      //10s P
                      //'to': 'd2VeiI14SPijdDYxyoAqll:APA91bGzi2QV-nQWA2yr6d_dAsBl1ouj6UeO_ajyLk4UwfJkXgoXCuYKC5PSISCPFTud1fl05KFTwTqQXxqUyqBjf7JkEpw03j7_VepL2yUeEWRcFNjIeFG747a5f_Qq8OLdHfA854-C',
                      //5g G
                      //'to':'eOCtztseTY-sStK8pWjUyr:APA91bFcCFH7veaxwHNQmow9yzDwdoRYz6X8HuTvXa8TB_49CfahlrqO4u7oX1cUGZmMaZGTQa2N8-TCQQOdNnDo1pWZdgdFe4W8kjK33wy1zsKDyBfExZj2lFErIcOhUy7QkHQzggAj',
                      //4g 12
                      //'to': 'dDN6-YaRQv6czfMyfp46Td:APA91bEuwyvOcHgZOCoZxkjCTonKFnSMg86LVRLZD0oIjdCQspGjgl0qesd0qV8v5ffoeRGFJL6YTG6R8wkRpCdGqzg6hvMiqwE9eqPuZcIvQSNv2X5LLODqyjDErA6rDHFV9hsXh6iG',
                      //8 TT
                      'to': 'dEcBt0ybQlqvu2WBaBCIDr:APA91bGPT7at0ZpLLoRIKBY3ScLAn01CY-At80NZInKsiFFJQE7_iefiJEXxoym67IV66iaIrutolu2czHU8UxOnt1e6Dd841-x-YTSaZU2Vfo_N4FWP_0NGffp0Bz8cnWsZtrROi9Ef',
                      //'to': value.toString(),
                      'priority': 'high',
                      //shown details
                      'notification': {
                        'title': 'Alert!',
                        'body': txtControl.text
                        //'body': "It's Emergency Alert ...",
                      },
                      //
                      'android': {
                        'notification': {'notification_count': 23},
                      },
                      //passed data
                      'data': {
                        //'type': "It's Emergency Alert ...",
                        'type': "It's ${txtControl.text}",
                        'id': '1234567890'
                      }
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
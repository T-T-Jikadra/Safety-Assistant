// ignore_for_file: camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Utils/constants.dart';

class fetch_Location extends StatefulWidget {
  const fetch_Location({super.key});

  @override
  State<fetch_Location> createState() => _fetch_LocationState();
}

class _fetch_LocationState extends State<fetch_Location> {
  final Color myColor = const Color.fromRGBO(128, 178, 247, 1);

  String coordinates = "No Location found";
  String address = 'No Address found';
  bool scanning = false;

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
        title: const Text("$appbar_display_name - Location "),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Image.asset(
            'assets/images/123.png',
            width: 200,
            height: 250,
          ),
          const SizedBox(height: 20),
          const Text(
            'Current Coordinates',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          scanning
              ? SpinKitThreeBounce(
                  color: myColor,
                  size: 20,
                )
              : Text(
                  coordinates,
                  style: const TextStyle(
                    fontSize: 16,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
          const SizedBox(height: 20),
          const Text(
            'Current Address',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          scanning
              ? SpinKitThreeBounce(
                  color: myColor,
                  size: 20,
                )
              : Text(
                  address,
                ),
          const Spacer(),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                checkPermission();
              },
              icon: const Icon(
                Icons.location_pin,
                color: Colors.white,
              ),
              label: const Text(
                'Current Location',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: myColor,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (kDebugMode) {
      print(serviceEnabled);
    }

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    permission = await Geolocator.checkPermission();

    if (kDebugMode) {
      print(permission);
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Request Denied !');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'Denied Forever !');
      return;
    }

    getLocation();
  }

  getLocation() async {
    setState(() {
      scanning = true;
    });

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      coordinates =
          'Latitude : ${position.latitude} \nLongitude : ${position.longitude}';

      List<Placemark> result =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (result.isNotEmpty) {
        Placemark placemark = result[0];
        address =
            '${placemark.name}, \n ${placemark.locality},\n ${placemark.subLocality},\n ${placemark.administrativeArea},\n ${placemark.country}';
        // You can add more properties like postal code, sub-administrative area, etc. based on your requirement.
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }

    setState(() {
      scanning = false;
    });
  }
}

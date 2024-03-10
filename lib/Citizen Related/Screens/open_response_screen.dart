import 'package:fff/Utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Open_Response_Screen extends StatefulWidget {
  final String selectedService;
  final String authorityName;
  final String regNo;
  final String address;
  final String phone;
  final String email;
  final String city;
  final String website;

  const Open_Response_Screen({
    super.key,
    required this.selectedService,
    required this.authorityName,
    required this.regNo,
    required this.address,
    required this.phone,
    required this.email,
    required this.city,
    required this.website,
  });

  @override
  State<Open_Response_Screen> createState() => _Open_Response_ScreenState();
}

// ignore: camel_case_types
class _Open_Response_ScreenState extends State<Open_Response_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 50,
          backgroundColor: Colors.black12,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25))),
          title: const Text("$appbar_display_name - Open Response"),
        ),
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    initialValue: widget.selectedService,
                    decoration: InputDecoration(
                      labelText: "selectedService",
                      prefixIcon: const Icon(Icons.account_balance_wallet),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      //fillColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    initialValue: widget.authorityName,
                    decoration: InputDecoration(
                      labelText: "authorityName",
                      prefixIcon: const Icon(Icons.ac_unit_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      //fillColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    initialValue: widget.regNo,
                    decoration: InputDecoration(
                      labelText: "regNo",
                      prefixIcon: const Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      //fillColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    initialValue: widget.address,
                    decoration: InputDecoration(
                      labelText: "address",
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      //fillColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    initialValue: widget.phone,
                    decoration: InputDecoration(
                      labelText: "phone",
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      //fillColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    initialValue: widget.email,
                    decoration: InputDecoration(
                      labelText: "email",
                      prefixIcon: const Icon(Icons.location_city),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      //fillColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    initialValue: widget.website,
                    decoration: InputDecoration(
                      labelText: "website",
                      prefixIcon: const Icon(Icons.location_city),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      //fillColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(onPressed: () {}, child: Text(widget.city)),
                ],
              ),
            ),
          ),
        ));
  }
}

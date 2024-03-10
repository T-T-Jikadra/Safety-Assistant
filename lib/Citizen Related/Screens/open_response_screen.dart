import 'package:fff/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
            padding: const EdgeInsets.only(left: 20, right: 25, top: 5),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  ..._buildTextContainers(
                    "Your selected Service :",
                    widget.selectedService,
                    "Responded authority name :",
                    widget.authorityName,
                  ),
                  ..._buildTextContainers(
                    "Responded authority Register no :",
                    widget.regNo,
                    "Responder authority address :",
                    widget.address,
                  ),
                  ..._buildTextContainers(
                    "Responder contact number :",
                    widget.phone,
                    "Responder Email :",
                    widget.email,
                  ),
                  ..._buildTextContainers(
                    "Website :",
                    widget.website,
                    "",
                    "",
                  ),
                  const SizedBox(height: 40),
                  const Text("Your selected Service :",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 17),
                      textAlign: TextAlign.start),
                  Text(widget.selectedService,
                      style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 25),
                  const Text("Responded authority name  :",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 17)),
                  Text(widget.authorityName,
                      style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 25),
                  const Text("Responded authority Register number :",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 17)),
                  Text(widget.regNo, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 25),
                  const Text("Responder authority address :",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 17)),
                  Text(widget.address, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Responder contact number :",
                              style: TextStyle(
                                  color: Colors.deepPurple, fontSize: 17)),
                          Text(widget.phone,
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                      const Icon(Iconsax.call)
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text("Responder Email :",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 17)),
                  Text(widget.email, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Website :",
                              style: TextStyle(
                                  color: Colors.deepPurple, fontSize: 17)),
                          Text(widget.website,
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                      const Icon(Iconsax.global),
                    ],
                  ),
                  const SizedBox(height: 25),
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
                  const SizedBox(height: 25)
                ],
              ),
            ),
          ),
        ));
  }

  List<Widget> _buildTextContainers(
      String label1, String text1, String label2, String text2) {
    return [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey.shade300),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label1,
                  style:
                      const TextStyle(color: Colors.deepPurple, fontSize: 16)),
              Text(text1, style: const TextStyle(fontSize: 13)),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey.shade100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label2,
                  style: TextStyle(
                      color: Colors.deepPurple.shade300, fontSize: 16)),
              Text(text2, style: const TextStyle(fontSize: 13)),
            ],
          ),
        ),
      ),
      const SizedBox(height: 25),
    ];
  }
}

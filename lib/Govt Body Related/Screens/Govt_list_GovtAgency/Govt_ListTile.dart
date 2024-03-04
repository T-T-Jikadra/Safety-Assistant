// ignore_for_file: library_private_types_in_public_api, camel_case_types, file_names
import 'package:flutter/material.dart';

import '../../../Utils/Utils.dart';

class govtListTile extends StatefulWidget {
  final String index;
  final String regNo;
  final String govtAgencyName;
  final String serviceList;
  final String contact;
  final String website;
  final String email;
  final String state;
  final String city;
  final String pinCode;
  final String address;
  final String pwd;

  const govtListTile({
    Key? key,
    required this.index,
    required this.regNo,
    required this.govtAgencyName,
    required this.serviceList,
    required this.contact,
    required this.website,
    required this.email,
    required this.state,
    required this.city,
    required this.pinCode,
    required this.address,
    required this.pwd,
  }) : super(key: key);

  @override
  _NgoListTileState createState() => _NgoListTileState();
}

class _NgoListTileState extends State<govtListTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _heightAnimation = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
          if (isExpanded) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        });
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 12,left: 10,right: 10),
        // Set margin to zero to remove white spaces
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      maxRadius: 14,
                      backgroundColor: Colors.grey,
                      child: Text(widget.index),
                    ),
                    textColor: Colors.white,
                    title: Text(
                      widget.govtAgencyName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text("Service List: ${widget.serviceList}"),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text("Contact: ${widget.contact}"),
                  ),
                ],
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              //vsync: this,
              child: SizedBox(
                height: isExpanded ? null : 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("Registration Number: ${widget.regNo}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("Address : ${widget.address}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("Pincode : ${widget.pinCode}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("City : ${widget.city}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("State : ${widget.state}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("Email : ${widget.email}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("Website : ${widget.website}"),
                      ),
                      // Text(widget.pwd),
                      SizedBox(
                        // height: 30,
                        // width: 50,
                          child: TextButton(
                              onPressed: () {
                                showToastMsg(widget.govtAgencyName);
                              },
                              child: const Text("View More")))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, top: 4),
              // Adjusting the padding
              child: SizedBox(
                height: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -44),
                      // Moving the icon slightly up
                      child: IconButton(
                        icon: Icon(
                            isExpanded ? Icons.expand_less : Icons.expand_more),
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                            if (isExpanded) {
                              _controller.forward();
                            } else {
                              _controller.reverse();
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

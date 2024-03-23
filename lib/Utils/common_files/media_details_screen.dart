// ignore_for_file: camel_case_types, depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants.dart';

class Media_Details_Screen extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;

  const Media_Details_Screen({super.key, required this.documentSnapshot});

  @override
  State<Media_Details_Screen> createState() => _Media_Details_ScreenState();
}

class _Media_Details_ScreenState extends State<Media_Details_Screen> {
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
        title: const Text("$appbar_display_name - Media Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 18),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Media Headline : ",
              style: TextStyle(
                //color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.documentSnapshot['news_title'],
              style: const TextStyle(
                color: Colors.deepPurple,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Divider(
              color: Colors.black12,
              thickness: 2,
              endIndent: 10,
              indent: 10,
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: AlignmentDirectional.center,
            child: Hero(
              tag: widget.documentSnapshot['news_id'],
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                      image: NetworkImage(
                          "${widget.documentSnapshot['news_image']}"),
                      fit: BoxFit.scaleDown,
                    )),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              thickness: 2,
              endIndent: 10,
              indent: 10,
            ),
          ),
          // ignore: sized_box_for_whitespace
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Media Description : ",
                  style: TextStyle(
                    //color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 2),
                    Text(
                      widget.documentSnapshot['news_description'],
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        const Spacer(),
                        const Icon(Icons.watch_later_outlined, size: 16),
                        const SizedBox(width: 5),
                        Text(
                            DateFormat('dd-MM-yyyy , HH:mm').format(
                                DateTime.parse(
                                    widget.documentSnapshot['sentTime'])),
                            style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

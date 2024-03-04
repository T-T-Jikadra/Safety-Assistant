// ignore_for_file: camel_case_types, file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../Utils/Utils.dart';
import '../../../Utils/constants.dart';
import 'NGO_ListTile.dart';

class NGO_List extends StatefulWidget {
  const NGO_List({super.key});

  @override
  State<NGO_List> createState() => _NGO_ListState();
}

class _NGO_ListState extends State<NGO_List> {
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
          title: const Text("$appbar_display_name - NGO List"),
        ),
        body: const Column(
          children: [
            ngo_list_widget(),
          ],
        ));
  }
}

class ngo_list_widget extends StatelessWidget {
  const ngo_list_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("NGO").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return NgoListTile(
                            index: "${index + 1}",
                            nameOfNGO: snapshot.data!.docs[index]["nameOfNGO"],
                            regNo: snapshot.data!.docs[index]["NGORegNo"],
                            serviceList: snapshot.data!.docs[index]["services"],
                            contact: snapshot.data!.docs[index]
                                ["contactNumber"],
                            email: snapshot.data!.docs[index]["email"],
                            website: snapshot.data!.docs[index]["website"],
                            state: snapshot.data!.docs[index]["state"],
                            city: snapshot.data!.docs[index]["city"],
                            pinCode: snapshot.data!.docs[index]["pinCode"],
                            address: snapshot.data!.docs[index]["fullAddress"],
                            pwd: snapshot.data!.docs[index]["password"],
                            // Add more fields as needed
                          );
                        }),
                  );
                }
              } else if (snapshot.hasError) {
                showToastMsg(snapshot.hasError.toString());
              } else {
                return const Center(child: CircularProgressIndicator());
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}

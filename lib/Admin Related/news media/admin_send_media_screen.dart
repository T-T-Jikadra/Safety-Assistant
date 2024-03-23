// ignore_for_file: library_private_types_in_public_api, camel_case_types, use_build_context_synchronously, avoid_print, non_constant_identifier_names

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fff/Utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../Models/send_news_model.dart';
import '../../Utils/Utils.dart';

class Admin_Send_News extends StatefulWidget {
  const Admin_Send_News({super.key});

  @override
  _Admin_Send_NewsState createState() => _Admin_Send_NewsState();
}

class _Admin_Send_NewsState extends State<Admin_Send_News> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final FocusNode _FocusNode = FocusNode();

  File? pickedImage;
  bool isPicked = false;
  bool _showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 50,
        backgroundColor: color_AppBar,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
        title: const Text("News media corner"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Selected Image : ',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            height: 180,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: Colors.deepPurple.withOpacity(0.4)),
                                borderRadius: BorderRadius.circular(20)),
                            child: isPicked
                                ? FutureBuilder<void>(
                                    future: loadImage(),
                                    // Use a function to handle loading the image
                                    builder: (BuildContext context,
                                        AsyncSnapshot<void> snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (snapshot.hasError) {
                                        return const Center(
                                          child: Text(
                                            'Error loading image',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        );
                                      } else {
                                        return Image.file(
                                          pickedImage!,
                                          fit: BoxFit.contain,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        );
                                      }
                                    },
                                  )
                                : const Center(
                                    child: Text(
                                      'No photo selected !',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                        //img selection
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Select your news image here  : ',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () async {
                                  final picker = ImagePicker();
                                  final XFile? image = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (image != null) {
                                    pickedImage = File(image.path);
                                    setState(() {
                                      isPicked = true;
                                      _showError = false;
                                    });
                                  }
                                },
                                child: Align(
                                  alignment: AlignmentDirectional.center,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Icon(Icons.add_a_photo_outlined,
                                        size: 25,
                                        color: Colors.deepPurple.shade400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (_showError)
                          const Padding(
                            padding: EdgeInsets.only(left: 25, top: 5),
                            child: Text(
                              '* Kindly select an image first ..',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Describe about media : ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _titleController,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: 'Enter title...',
                            labelText: 'Media Title',
                            prefixIcon: const Icon(Icons.newspaper),
                            focusColor: Colors.deepPurple,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              _FocusNode.requestFocus();
                              return 'Heading required ';
                            }
                            if (value.isNotEmpty && value.length < 5) {
                              _FocusNode.requestFocus();
                              return "Too short heading";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _descriptionController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          maxLength: 150,
                          decoration: InputDecoration(
                            hintText: 'Enter description...',
                            labelText: 'Media Description',
                            prefixIcon: const Icon(Icons.description_outlined),
                            focusColor: Colors.deepPurple,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              _FocusNode.requestFocus();
                              return 'Enter description';
                            }
                            if (value.isNotEmpty && value.length < 10) {
                              _FocusNode.requestFocus();
                              return "Too short description";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Container(
                padding: const EdgeInsets.only(bottom: 8),
                width: double.infinity,
                child: ClipRRect(
                    child: ElevatedButton(
                        onPressed: () async {
                          // Show progress indicator
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return const Dialog(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 35, bottom: 25, left: 20, right: 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 15),
                                      CircularProgressIndicator(
                                          color: Colors.blue),
                                      SizedBox(height: 30),
                                      Text('Processing ...')
                                    ],
                                  ),
                                ),
                              );
                            },
                          );

                          // If form is valid, upload data
                          if (isPicked == false) {
                            setState(() {
                              _showError = true;
                            });
                            // Navigator.pop(
                            //     context); // Dismiss progress indicator
                          }
                          // Check if the form is valid
                          if (_formKey.currentState!.validate()) {
                            // Upload image to Firebase Storage
                            String? imageUrl =
                                await uploadImageToStorage(pickedImage!);

                            // Remove progress indicator
                            Navigator.pop(context);

                            if (imageUrl != null) {
                              // If image upload is successful, upload data to Firestore
                              String description = _descriptionController.text;
                              await uploadDataToFirestore(
                                  imageUrl, description);

                              // Reset form fields
                              setState(() {
                                isPicked = false;
                                _showError = false;
                                _descriptionController.text = '';
                              });

                              // Show success message
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('News released successfully')),
                              );
                            } else {
                              // If image upload fails, show error message
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Failed to release news')),
                              );
                            }
                          } else {
                            // If form is not valid, dismiss progress indicator and show error messages
                            Navigator.pop(
                                context); // Dismiss progress indicator
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)))),
                        child: const Text("Release news"))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  Future<String?> uploadImageToStorage(File imageFile) async {
    try {
      firebase_storage.Reference storageRef = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('news')
          .child('${DateTime.now().microsecondsSinceEpoch}.jpg');

      firebase_storage.UploadTask uploadTask = storageRef.putFile(imageFile);
      await uploadTask.whenComplete(() => print("Image uploaded to Storage"));
      String imageURL = await storageRef.getDownloadURL();
      return imageURL;
    } catch (e) {
      if (kDebugMode) {
        print("Error while uploading news image : $e");
      }
    }
    return null;
  }

  uploadDataToFirestore(String imageUrl, String description) async {
    try {
      int totalDocCount = 0;
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        // Get the current count of requests
        DocumentSnapshot snapshot = await transaction.get(FirebaseFirestore
            .instance
            .collection("clc_news")
            .doc("news_count"));
        totalDocCount = (snapshot.exists) ? snapshot.get('count') : 0;
        totalDocCount++;

        transaction.set(
            FirebaseFirestore.instance.collection("clc_news").doc("news_count"),
            {'count': totalDocCount});
      });

      News_Registration newsData = News_Registration(
          news_Id: "News_${totalDocCount.toString()}",
          news_image: imageUrl,
          news_title: _titleController.text.trim(),
          news_desc: description);

      Map<String, dynamic> AdminAlertJson = newsData.toJsonNews();

      await FirebaseFirestore.instance
          .collection("clc_news")
          .doc("News_${totalDocCount.toString()}")
          .set(AdminAlertJson)
          .then((value) =>
              showMsgDialog(context, 'News published successfully ..'));
    } catch (e) {
      // An error occurred
      if (kDebugMode) {
        print('Error adding alert data to firestore : $e');
      }
    }
  }

  Future<void> loadImage() async {
    await Future.delayed(const Duration(seconds: 1));
  }

// function for selecting multiple images
// Future getImages() async {
//   final pickedFIle = await picker.pickImage(
//       imageQuality: 100,
//       maxHeight: 1000,
//       maxWidth: 1000, source: ImageSource.gallery);
//  // List<XFile> xfilePick = pickedFIle;
//
//   setState(() {
//     if (pickedFIle.isNotEmpt) {
//       for (var i = 0; i < xfilePick.length; i++) {
//         selectedImages.add(File(xfilePick[i].path));
//       }
//     }
//     else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Nothing is selected')));
//     }
//   });
// }
}

// ignore_for_file: library_private_types_in_public_api, camel_case_types, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';

class User_Feedback_Screen extends StatefulWidget {
  final String authority_name;
  final String authority_id;
  final String respond_id;

  const User_Feedback_Screen(
      {super.key,
      required this.authority_name,
      required this.authority_id,
      required this.respond_id});

  @override
  _User_Feedback_ScreenState createState() => _User_Feedback_ScreenState();
}

class _User_Feedback_ScreenState extends State<User_Feedback_Screen> {
  int _starRating = 1;
  final List<bool> _checkboxValues = [false, false, false, false];
  bool _thumbsUpSelected = false;
  bool _thumbsDownSelected = false;

  void _selectStar(int rating) {
    setState(() {
      _starRating = rating;
    });
  }

  void _toggleCheckbox(int index) {
    setState(() {
      _checkboxValues[index] = !_checkboxValues[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        elevation: 50,
        backgroundColor: Colors.black12,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
        title: const Text("Submit feedback"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            //stars
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      const Text("Select rating as per service :",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 15),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 18),
                          Row(
                            children: List.generate(
                              5,
                              (index) => GestureDetector(
                                onTap: () => _selectStar(index + 1),
                                child: Icon(
                                  index < _starRating
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.orangeAccent,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 18),
                          _starRating == 1
                              ? const Text('Poor',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16))
                              : _starRating == 2
                                  ? const Text('Fair',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16))
                                  : _starRating == 3
                                      ? const Text('Average',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16))
                                      : _starRating == 4
                                          ? const Text('Good',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16))
                                          : _starRating == 5
                                              ? const Text('Excellent',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16))
                                              : const Text(''),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       const Text('Selected Rating:'),
            //       const SizedBox(width: 10),
            //       Text(_starRating.toString()),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       const Text('Select emojis:'),
            //       const SizedBox(width: 10),
            //       // Display different emojis based on star rating
            //       _starRating == 1
            //           ? const Text('Poor')
            //           : _starRating == 2
            //               ? const Text('Fair')
            //               : _starRating == 3
            //                   ? const Text('Average')
            //                   : _starRating == 4
            //                       ? const Text('Good')
            //                       : _starRating == 5
            //                           ? const Text('Excellent')
            //                           : const Text(''),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
              //btn
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Text('What can be improved ?',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(height: 15),
                      // Display custom checkboxes
                      Wrap(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () => _toggleCheckbox(0),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: _checkboxValues[0]
                                        ? Colors.green.shade200
                                        : Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text('Checkbox 1'),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () => _toggleCheckbox(1),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: _checkboxValues[1]
                                        ? Colors.green.shade200
                                        : Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text('Checkbox 2'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 13),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () => _toggleCheckbox(2),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: _checkboxValues[2]
                                        ? Colors.green.shade200
                                        : Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text('Checkbox 4'),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () => _toggleCheckbox(3),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: _checkboxValues[3]
                                        ? Colors.green.shade200
                                        : Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text('Checkbox 5'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //other
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Text('Tell us more !',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(height: 15),
                      // Display custom checkboxes
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Was service fulfilled ? :'),
                          const Spacer(),
                          const SizedBox(width: 10),
                          // Display thumbs up and thumbs down icons
                          GestureDetector(
                            onTap: () {
                              _thumbsUpSelected = !_thumbsUpSelected;
                              setState(() {
                                _thumbsDownSelected = false;
                              });
                            },
                            child: Icon(
                              Icons.thumb_up,
                              color:
                                  _thumbsUpSelected ? Colors.blue : Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              _thumbsDownSelected = !_thumbsDownSelected;
                              setState(() {
                                _thumbsUpSelected = false;
                              });
                            },
                            child: Icon(
                              Icons.thumb_down,
                              color: _thumbsDownSelected
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Text('Add detailed review !',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(height: 15),
                      //desc
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          maxLength: 100,
                          decoration: InputDecoration(
                            hintText: 'Write your feedback here ...',
                            // border: OutlineInputBorder(
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(5))),
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                width: double.infinity,
                child: ClipRRect(
                    child: ElevatedButton(
                        onPressed: () async {
                          //progress
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
                          await Future.delayed(
                              const Duration(milliseconds: 1300));
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)))),
                        child: const Text("Submit"))),
              ),
            ),
            //const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

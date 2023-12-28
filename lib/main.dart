import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final nameController = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: //Wrapper(),
          Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'add',
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    CollectionReference colRef =
                        FirebaseFirestore.instance.collection('client');
                    colRef.add({'name': nameController.text});
                  },
                  child: const Text("Add to database"))
            ],
          ),
        ),
      ),
    );
  }
}

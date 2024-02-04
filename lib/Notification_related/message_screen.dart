import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: msgScreen(),
    );
  }
}

// ignore: camel_case_types
class msgScreen extends StatefulWidget {
  const msgScreen({super.key});

  @override
  State<msgScreen> createState() => _msgScreenState();
}

// ignore: camel_case_types
class _msgScreenState extends State<msgScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('hey'),
      ),
      body:
      Center(
        child:
        ElevatedButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessageScreen(),
                ));
          },

          child: Text('tap'),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../Notification_related/message_screen.dart';

// ignore: camel_case_types
class commonbg extends StatelessWidget {
  const commonbg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png")),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 78, sigmaY: 78),
          ),
        ),
        const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 78, sigmaY: 78),
            child: const SizedBox(),
          ),
        ),

        //home design
        Center(
          child: ElevatedButton(
            child: const Text("Click"),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const msgScreen())
              );
            },
          ),
        ),
      ],
    );
  }
}

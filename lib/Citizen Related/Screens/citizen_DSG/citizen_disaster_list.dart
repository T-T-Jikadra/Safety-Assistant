// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

import '../../../Utils/constants.dart';
import 'citizen_guide_list.dart';

class DisasterList {
  final String disaster;

  DisasterList(this.disaster);
}

class Digital_Guide_Screen extends StatefulWidget {
  const Digital_Guide_Screen({super.key});

  @override
  State<Digital_Guide_Screen> createState() => _Digital_Guide_ScreenState();
}

class _Digital_Guide_ScreenState extends State<Digital_Guide_Screen> {
  static List<String> DisasterName = [
    'Flood',
    'Cyclone',
    'Tsunami',
    'EarthQuick',
    'Avalanche',
    'Fire',
    'Gas and Chemical Leakages',
    'Cold Wave',
    'Thunder Storm',
    'Heat wave',
    'Lighting',
    'Drought',
    'Forest Fire',
    'Landslide',
    'Smog / Air Pollution',
    'Biological Emergencies',
    'Nuclear Radiological Emergencies'
  ];
  final List<DisasterList> DisasterData = List.generate(
      DisasterName.length, (index) => DisasterList(DisasterName[index]));

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
        title: const Text("Digital Survival Guide"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: DisasterData.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(DisasterData[index].disaster),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Display(
                              disasterList: DisasterData[index],
                            )));
                  },
                ),
              );
            }),
      ),
    );
  }
}

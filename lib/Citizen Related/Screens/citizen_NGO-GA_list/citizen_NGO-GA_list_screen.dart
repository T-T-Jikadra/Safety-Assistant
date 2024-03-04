import 'package:flutter/material.dart';

import '../../../Govt Body Related/Screens/Govt_list_GovtAgency/Govt_list_GovtAgency.dart';
import '../../../NGO Related/Screens/NGO_list/NGO_list.dart';
import '../../../Utils/constants.dart';

// ignore: camel_case_types
class NGO_GA_ListScreen extends StatefulWidget {
  const NGO_GA_ListScreen({super.key});

  @override
  State<NGO_GA_ListScreen> createState() => _NGO_GA_ListScreenState();
}

// ignore: camel_case_types
class _NGO_GA_ListScreenState extends State<NGO_GA_ListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            elevation: 50,
            backgroundColor: Colors.white24,
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            title: const Text("$appbar_display_name - Req History Page"),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'NGO'), // First tab
                Tab(text: 'Govt'), // Second tab
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              // Content of the first tab (NGO)
              Column(
                children: [
                  SizedBox(height: 25),
                  ngo_list_widget(),
                ],
              ),
              // Content of the second tab (Govt)
              Column(
                children: [
                  SizedBox(height: 25),
                  govt_list_widget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import '../../../Govt Body Related/Screens/Govt_list_GovtAgency/Govt_list.dart';
import '../../../NGO Related/Screens/NGO_list/NGO_list.dart';
import '../../../Utils/dropdown_Items.dart';

// ignore: camel_case_types
class NGO_GA_ListScreen extends StatefulWidget {
  const NGO_GA_ListScreen({super.key});

  @override
  State<NGO_GA_ListScreen> createState() => _NGO_GA_ListScreenState();
}

// ignore: camel_case_types
class _NGO_GA_ListScreenState extends State<NGO_GA_ListScreen> {
  String selectedState = '';
  String selectedCity = '';
  String selectedState_ngo = '';
  String selectedCity_ngo = '';
  List<String> dropdownItemCity = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedState = DropdownItems.dropdownItemState.first;
    updateCityList(selectedState);
    selectedState_ngo = DropdownItems.dropdownItemState.first;
    updateCityList(selectedState_ngo);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          //backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 50,
            backgroundColor: Colors.black12,
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            title: const Text("Govt Agencies"),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'NGO'), // First tab
                Tab(text: 'Government'), // Second tab
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Content of the first tab (NGO)
              Column(
                children: [
                  const SizedBox(height: 15),
                  //state
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                          ),
                          child: SizedBox(
                            height: 60,
                            child: DropdownButtonFormField<String>(
                              value: selectedState_ngo,
                              items: DropdownItems.dropdownItemState
                                  .map((String state) {
                                return DropdownMenuItem<String>(
                                  // alignment: AlignmentDirectional.topStart,
                                  value: state,
                                  child: Text(state),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedState_ngo = value!;
                                  // Update city list based on the selected state
                                  updateCityList(selectedState_ngo);
                                  // Reset selected city when state changes
                                  selectedCity_ngo = '';
                                });
                              },
                              decoration: const InputDecoration(
                                // border: OutlineInputBorder(),
                                hintText: "Select your State",
                              ),
                              //hint: const Text("Select your State"), // Hint text displayed initially
                              validator: (value) {
                                if (value == "Select your state") {
                                  return 'Select your State';
                                }
                                return null; // Return null if the input is valid
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  //city
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    child: SizedBox(
                      height: 60,
                      child: DropdownButtonFormField<String>(
                        value: selectedCity_ngo.isNotEmpty
                            ? selectedCity_ngo
                            : null,
                        items: dropdownItemCity.map((String city) {
                          return DropdownMenuItem<String>(
                            value: city,
                            child: Text(city),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCity_ngo = value!;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: "Select your City",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ngo_list_widget(
                      selectedState: selectedState_ngo,
                      selectedCity: selectedCity_ngo),
                ],
              ),
              // Content of the second tab (Govt)
              Column(
                children: [
                  const SizedBox(height: 15),
                  //state
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                          ),
                          child: SizedBox(
                            height: 60,
                            child: DropdownButtonFormField<String>(
                              value: selectedState,
                              items: DropdownItems.dropdownItemState
                                  .map((String state) {
                                return DropdownMenuItem<String>(
                                  // alignment: AlignmentDirectional.topStart,
                                  value: state,
                                  child: Text(state),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedState = value!;
                                  // Update city list based on the selected state
                                  updateCityList(selectedState);
                                  // Reset selected city when state changes
                                  selectedCity = '';
                                });
                              },
                              decoration: const InputDecoration(
                                // border: OutlineInputBorder(),
                                hintText: "Select your State",
                              ),
                              //hint: const Text("Select your State"), // Hint text displayed initially
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  //city
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    child: SizedBox(
                      height: 60,
                      child: DropdownButtonFormField<String>(
                        value: selectedCity.isNotEmpty ? selectedCity : null,
                        items: dropdownItemCity.map((String city) {
                          return DropdownMenuItem<String>(
                            value: city,
                            child: Text(city),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCity = value!;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: "Select your City",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  govt_list_widget(
                      selectedState: selectedState, selectedCity: selectedCity),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateCityList(String state) {
    setState(() {
      dropdownItemCity = DropdownItems.cityMap[state] ?? [];
    });
  }
}

import 'package:fff/Utils/constants.dart';
import 'package:flutter/material.dart';

import 'faq_model.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
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
        title: const Text("$appbar_display_name - FAQ "),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              FAQ(
                  showDivider: false,
                  question: "How to login?",
                  answer:
                      "A phone number or email id is required for login. An OTP will be sent to your phone no/ email id for login."),
              FAQ(
                  question: "Can I use the app in different languages?",
                  answer:
                      "Yes, the app can be used in 12 different regional languages."),
              FAQ(
                  question: "How do I get alerts for my current location?",
                  answer:
                      "By giving location permission, you can receive alerts for your area."),
              FAQ(
                  question: "How will I know the severity of alerts?",
                  answer:
                      "All alerts are color coded to indicate their severity level. Red/Black is high, Orange is medium, Yellow is low, Green is advisory"),
              FAQ(
                  question: "Can I get alerts for another location?",
                  answer:
                      "Yes, this can be done by subscribing location(s).You will receive alerts for all the locations you subscribe for."),
              FAQ(
                  question: "How do I subscribe to a location?",
                  answer:
                      "Go to Locations >> SUBSCRIBE LOCATIONS',select the district/state you want to subscribe to and hit the 'subscribe' button."),
              FAQ(
                  question: "How can I get details of the alert?",
                  answer:
                      "Details of the alert can be viewed under 'Active Alerts' on the homepage."),
              FAQ(
                  question: "How can I get help near my location?",
                  answer:
                      "you can contact the state helpline numbers provided in the helpline section You can also dial the emergency number 112."),
              FAQ(
                  question: "Can I get weather information?",
                  answer:
                      "All weather details can be seen in the 'Weather' section of the app along with daily forecasts and on homepage."),
              FAQ(
                  question:
                      "How do I get to know what to do at the time of disaster?",
                  answer:
                      "For every alert visible on the homepage, do's and don'ts are provided for reference."),
              FAQ(
                  question: "How will my data be used?",
                  answer:
                      "Your data will be kept in encrypted format and will only be used for delivering disaster and relief related information."),
              FAQ(
                  question: "Can I share the disaster alerts with others?",
                  answer:
                      "'Share' option in the 'Live Alerts' section is given from where alerts can be shared with anyone through different media."),
              FAQ(
                  question: "How do I submit my details?",
                  answer:
                      "Go to the 'Account' section. Here you can update your profile with your personal details and details of emergency contact who can be contacted in case of any emergency or disaster."),
              FAQ(
                  question: "How do I know if these warnings are authentic?",
                  answer:
                      "Each and every warning published on the app is from recognized Government agencies, like the India Meteorological Department (IMD), Central Water Commission (CWC). Indian National Centre for Ocean Information Services (INCOIS). Defence Geoinformatics Research Establishment (GRE). Forest Survey of India (FSI) & various State Disaster Management Authorities (SDMAs') which are apex bodies responsible in case of any disaster."),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fff/Utils/constants.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
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
        title: const Text("$appbar_display_name - About Us "),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0),
              Center(
                child: CircleAvatar(
                  radius: 100.0,
                  //add our app logo here
                  backgroundImage:
                      AssetImage("assets/images/electricity_user_1.jpg"),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Citizen emergency and helpdesk system',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'This system is made to make disasters have less impact. It\'s supposed to help in a better and easier way to prevent too much damage. Apart from disaster if you got any emergency in your nearby area you can seek help from your nearby NGO (Non Governmental Organization) and Government Agencies with just two clicks.There can be a need of Ambulance for any health emergency, need of Fire brigade to get control on fire, need of rescue teams in case of disaster like ( Earthquake , Cyclone, Flood etc) need of NGOs who can serve food and water to needy peoples. The main advantage of this system is it combines two different entity ( NGOs and Government Agencies ) so that they can work together to minimize the impact of any Disaster. This system allows citizen to get pre-alert notification about predictable disasters and news about various work that has been done by different NGOs and Government Agencies. There would be surely a Feedback mechanism so that citizen can able to send a feedback to the NGOs and Government agencies who are in service.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'Our Mission',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Our Missions is a wide range of activities, such as dispatching emergency services (police, fire, medical), coordinating search and rescue operations, providing medical assistance, delivering supplies or aid to affected areas, or any other actions required to address the emergency or provide assistance to those in need.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'Privacy Policy & Terms of Service',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Privacy Policy:',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'In Privacy Policy It\'s include the types of data collected (such as personal information, location data, emergency requests), the purposes for which the data is collected is providing emergency assistance, improving services,and also address user privacy is safeguarded, including measures taken to secure data, protocols for data access and sharing, and procedures for handling data breaches or incidents. Additionally,users have rights regarding their data, such as the right to access, correct, or delete their information, as well as how users can contact the organization with inquiries or concerns about privacy practices.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Terms of Service:',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'The Terms of ServiceIt\'s includes provisions related to user eligibility (such as age or residency requirements), account registration and management, acceptable Terms & condition  of the system (including prohibited activities),outlining the responsibilities of both users and the service provider in the event of disputes, damages, or losses arising from system usage.Furthermore,aspects related to service availability, modifications to the system or terms, termination of accounts or access, and dispute resolution mechanisms.Users are usually required to agree to the Terms of Service before using the system, and violations of these terms may result in penalties or account suspension/termination.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'Social Media Links',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'give your company\'s social media links',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'Acknowledgments',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Describe your company\'s Acknowledgments here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'Updates and Roadmap',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Describe your company\'s Updates and Roadmap here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'Contact Us',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'You can contact us at:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'divyakumbhani99796@gmail.com\n+91 9979661529',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}

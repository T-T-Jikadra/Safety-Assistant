//import 'package:fff/Utils/constants.dart';
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
        title: const Text(" About Us"),
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
                  backgroundColor: Colors.white,
                  radius: 85.0,
                  //add our app logo here
                  backgroundImage: AssetImage("assets/images/logo.png"),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Emergency Response Support System',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                'This system is made to make disasters have less impact. It\'s supposed to help in a better and easier way to prevent too much damage. Apart from disaster if you got any emergency in your nearby area you can seek help from your nearby NGO (Non Governmental Organization) and Government Agencies with just two clicks.There can be a need of Ambulance for any health emergency, need of Fire brigade to get control on fire, need of rescue teams in case of disaster like ( Earthquake , Cyclone, Flood etc) need of NGOs who can serve food and water to needy peoples. The main advantage of this system is it combines two different entity ( NGOs and Government Agencies ) so that they can work together to minimize the impact of any Disaster. This system allows citizen to get pre-alert notification about predictable disasters and news about various work that has been done by different NGOs and Government Agencies. There would be surely a Feedback mechanism so that citizen can able to send a feedback to the NGOs and Government agencies who are in service.',
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(fontSize: 16.0, wordSpacing: 0.0),
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
                'Our Missions is a wide range of activities, such as dispatching '
                'emergency services (police, fire, medical), coordinating search '
                'and rescue operations, providing medical assistance, delivering '
                'supplies or aid to affected areas, or any other actions required '
                'to address the emergency or provide assistance to those in need.',
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(fontSize: 16.0, wordSpacing: 0.0),
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
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.0),
              Text(
                'In Privacy Policy It\'s include the types of data collected ('
                'such as personal information, location data, emergency requests), '
                'the purposes for which the data is collected is providing emergency '
                'assistance, improving services,and also address user privacy is safeguarded, '
                'including measures taken to secure data, protocols for data access and sharing, '
                'and procedures for handling data breaches or incidents. Additionally,users have '
                'rights regarding their data, such as the right to access, correct, or delete their '
                'information, as well as how users can contact the organization with inquiries or '
                'concerns about privacy practices.',
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(fontSize: 16.0, wordSpacing: 0.2),
              ),
              SizedBox(height: 10.0),
              Text(
                'Terms of Service:',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.0),
              Text(
                'The Terms of Services includes provisions '
                'related to user eligibility (such as age or residency requirements), '
                'account registration and management, acceptable Terms & condition  '
                'of the system (including prohibited activities),outlining the responsibilities '
                'of both users and the service provider in the event of disputes, damages, or '
                'losses arising from system usage.Furthermore,aspects related to service availability, '
                'modifications to the system or terms, termination of accounts or access, and dispute '
                'resolution mechanisms.Users are usually required to agree to the Terms of Service before '
                'using the system, and violations of these terms may result in penalties or account '
                'suspension/termination.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16.0, wordSpacing: 0.2),
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
                'First and foremost, we express our appreciation to the developers '
                'and engineers whose tireless efforts have brought this application to '
                'fruition. Their technical prowess, innovative thinking, and unwavering '
                'commitment have been instrumental in creating a platform that can potentially '
                'save lives and mitigate the impact of disasters.\n\nLast but not least,'
                'we thank the users of the CAS for their trust and engagement. It is their willingness to embrace new technologies and adopt proactive measures that ultimately drive the success and effectiveness of this initiative.',
                textAlign: TextAlign.justify,
                softWrap: true,
                style: TextStyle(fontSize: 16.0, wordSpacing: 0.1),
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
                'out team will try our best to publish updates and new features to the application soon as soon possible.',
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
                'help.cas@gmail.com\n+91 9979661529',
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

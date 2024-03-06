import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class ApplyForGrant extends StatefulWidget {
  const ApplyForGrant({super.key});

  @override
  State<ApplyForGrant> createState() => _ApplyForGrantState();
}

class _ApplyForGrantState extends State<ApplyForGrant> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 50,
          backgroundColor: Colors.white24,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25))),
          title: const Text("$appbar_display_name - About Us "),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
                'Apply online for any Grant-in-aid \n to any Ministry or Department',
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            const Divider(
              height: 1,
              thickness: 1.5,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                    left: 15,
                    top: 0,
                    bottom: 30,
                  ),
                  child: Column(
                    children: [
                      // 1st container
                      GestureDetector(
                        onTap: () {
                          const link =
                              'https://mofapp.nic.in/deagrants/deango/default.aspx';

                          launchUrl(Uri.parse(link),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff7871db),
                              borderRadius: BorderRadius.circular(9)),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Ministry of finance',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white)),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      GestureDetector(
                        onTap: () {
                          const link = 'http://www.moefngo.nic.in/ngo/';

                          launchUrl(Uri.parse(link),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff7871db),
                              borderRadius: BorderRadius.circular(9)),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                'Ministry of Environment,Forest and Climate change',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white)),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      // 1st container

                      GestureDetector(
                        onTap: () {
                          const link =
                              'https://www.mha.gov.in/en/commoncontent/implementation-of-rule-2302-of-gfr-2017';

                          launchUrl(Uri.parse(link),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff7871db),
                              borderRadius: BorderRadius.circular(9)),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Ministry of home affairs',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white)),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      GestureDetector(
                        onTap: () {
                          const link = 'https://csms.nic.in/login/index.php';

                          launchUrl(Uri.parse(link),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff7871db),
                              borderRadius: BorderRadius.circular(9)),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Department for Animal Welfare',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white)),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      GestureDetector(
                        onTap: () {
                          const link =
                              'https://www.pmindia.gov.in/en/pms-funds/';

                          launchUrl(Uri.parse(link),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff7871db),
                              borderRadius: BorderRadius.circular(9)),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('PMO India',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white)),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      GestureDetector(
                        onTap: () {
                          const link = 'https://ngo.mib.gov.in/';

                          launchUrl(Uri.parse(link),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff7871db),
                              borderRadius: BorderRadius.circular(9)),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                'Ministry of information and broadcasting',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white)),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      GestureDetector(
                        onTap: () {
                          const link = 'https://sampada-mofpi.gov.in/';

                          launchUrl(Uri.parse(link),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff7871db),
                              borderRadius: BorderRadius.circular(9)),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                'Ministry of food processing industries',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white)),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      GestureDetector(
                        onTap: () {
                          const link = 'https://ngodarpan.nacwc.gov.in/';

                          launchUrl(Uri.parse(link),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff7871db),
                              borderRadius: BorderRadius.circular(9)),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Ministry of Housing and Urban Affairs',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white)),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      GestureDetector(
                        onTap: () {
                          const link = 'https://grants-msje.gov.in/ngo-login';

                          launchUrl(Uri.parse(link),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff7871db),
                              borderRadius: BorderRadius.circular(9)),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Department for transportation',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white)),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      GestureDetector(
                        onTap: () {
                          const link =
                              'https://jsactr.mowr.gov.in/ngogrant/pages/Account/login.aspx';

                          launchUrl(Uri.parse(link),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff7871db),
                              borderRadius: BorderRadius.circular(9)),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                'Ministry of Electronics and Information technology',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white)),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      GestureDetector(
                        onTap: () {
                          const link = 'http://ngodordgoi.nic.in/';

                          launchUrl(Uri.parse(link),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff7871db),
                              borderRadius: BorderRadius.circular(9)),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Ministry of Rural Development',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white)),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      GestureDetector(
                        onTap: () {
                          const link = 'https://aimapp2.aim.gov.in/';

                          launchUrl(Uri.parse(link),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff7871db),
                              borderRadius: BorderRadius.circular(9)),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('NITI Aayog',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white)),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      GestureDetector(
                        onTap: () {
                          const link =
                              'https://jsactr.mowr.gov.in/ngogrant/pages/Account/login.aspx';

                          launchUrl(Uri.parse(link),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff7871db),
                              borderRadius: BorderRadius.circular(9)),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Ministry of Jal Shakti',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

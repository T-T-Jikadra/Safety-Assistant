import 'package:flutter/material.dart';
import 'citizen_disaster_list.dart';

class Display extends StatelessWidget {
  final DisasterList disasterList;

  const Display({Key? key, required this.disasterList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(disasterList.disaster),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
          child: Column(
            children: [
              Container(
                //height: 740,
                width: 370,
                decoration: BoxDecoration(
                  color: const Color(0xfff5f5f5),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 20, left: 15, right: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          disasterList.disaster,
                          style: const TextStyle(
                              color: Color((0xff7871db)),
                              fontSize: 23,
                              fontWeight: FontWeight.w600),
                        ),
                        const Divider(
                          height: 14,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Do\'s',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'do this in ${disasterList.disaster}',
                          style: const TextStyle(),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Don\'ts',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Don't do this in ${disasterList.disaster}",
                          style: const TextStyle(),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Additional Instructions',
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Additional Instructions can be show here',
                          style: TextStyle(),
                        ),
                        /* Text(
                          //Ignore rumours, Stay calm, Don't panic\n
                          'Keep your mobile phones charged for emergency communication; use SMS.
                          \nListen to radio, watch TV, read newspapers for weather updates.
                           \nKeep your documents and valuables in water-proof containers.
                           \nTry staying in an empty room; keep movable items securely tied.
                           \nPrepare an emergency kit with essential items for safety and survival.
                           \nSecure your house, especially the roof; carry out repairs; dont leave sharp objects loose.
                           \nKeep cattle/animals untied to ensure their safety.
                           \nIn case of a storm surge/tide warning, or flooding, know your nearest safe high ground/ safe shelter and the safest access route to it.
                           \nStore adequate ready-to-eat food and water to last at least a week.
                           \nConduct mock drills for your family and community.
                           \nTrim treetops and branches near your house with permission from the local authority.
                           \nClose doors and windows securely.
                           \nEvacuate immediately to safe places when directed by government officials.
                           \n',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,

                            // fontWeight: FontWeight.w600
                          ),
                        ),*/
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff7871db),
                              shape: const ContinuousRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              foregroundColor: Colors.white),
                          child: const Text("back"),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fff/Screens/entry_point.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import '../../../Models/User_Registration_Model.dart';
import '../../../Utils/constants.dart';
import '../../../mobile Otp/screens/login_screen/login_screen.dart';
import 'custom_checkbox_button.dart';
import 'custom_radio_button.dart';

// ignore: must_be_immutable
class CitizenSignupPageScreen extends StatefulWidget {
  const CitizenSignupPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<CitizenSignupPageScreen> createState() =>
      _CitizenSignupPageScreenState();
}

class _CitizenSignupPageScreenState extends State<CitizenSignupPageScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController fnameTextController = TextEditingController();
  TextEditingController lnameTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController birthDateTextController = TextEditingController();
  TextEditingController pinCodeTextController = TextEditingController();
  TextEditingController fullAddressTextController = TextEditingController();

  String? genderRadio;
  bool showErrorTnC = false;

  List<String> genderList = ["Male", "Female", "Others"];

  String selectedState = '';
  String selectedCity = ''; // Variable to hold the selected city value

  List<String> dropdownItemState = [
    "Select your state",
    "Andaman & Nicobar Islands",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Diu & Daman",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu & Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Ladakh",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Puducherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
  ];

  List<String> dropdownItemCity = [];

  Map<String, List<String>> cityMap = {
    "Andaman & Nicobar Islands": ["Port Blair"],
    "Andhra Pradesh": [
      "Adoni",
      "Amaravati",
      "Anantapur",
      "Chandragiri",
      "Chittoor",
      "Dowlaiswaram",
      "Eluru",
      "Guntur",
      "Kadapa",
      "Kakinada",
      "Kurnool",
      "Machilipatnam",
      "Nagarjunakoṇḍa",
      "Rajahmundry",
      "Srikakulam",
      "Tirupati",
      "Vijayawada",
      "Visakhapatnam",
      "Vizianagaram",
      "Yemmiganur"
    ],
    "Arunachal Pradesh": ["Itanagar"],
    "Assam": [
      "Dhuburi",
      "Dibrugarh",
      "Dispur",
      "Guwahati",
      "Jorhat",
      "Nagaon",
      "Sivasagar",
      "Silchar",
      "Tezpur",
      "Tinsukia"
    ],
    "Bihar": [
      "Ara",
      "Barauni",
      "Begusarai",
      "Bettiah",
      "Bhagalpur",
      "Bihar Sharif",
      "Bodh Gaya",
      "Buxar",
      "Chapra",
      "Darbhanga",
      "Dehri",
      "Dinapur Nizamat",
      "Gaya",
      "Hajipur",
      "Jamalpur",
      "Katihar",
      "Madhubani",
      "Motihari",
      "Munger",
      "Muzaffarpur",
      "Patna",
      "Purnia",
      "Pusa",
      "Saharsa",
      "Samastipur",
      "Sasaram",
      "Sitamarhi",
      "Siwan"
    ],
    "Chandigarh": ["Chandigarh"],
    "Chhattisgarh": [
      "Ambikapur",
      "Bhilai",
      "Bilaspur",
      "Dhamtari",
      "Durg",
      "Jagdalpur",
      "Raipur",
      "Rajnandgaon"
    ],
    "Diu & Daman": ["Daman", "Diu", "Silvassa"],
    "Delhi": ["Delhi", "New Delhi"],
    "Goa": ["Madgaon", "Panaji"],
    "Gujarat": [
      "Ahmadabad",
      "Amreli",
      "Bharuch",
      "Bhavnagar",
      "Bhuj",
      "Dwarka",
      "Gandhinagar",
      "Godhra",
      "Jamnagar",
      "Junagadh",
      "Kandla",
      "Khambhat",
      "Kheda",
      "Mahesana",
      "Morbi",
      "Nadiad",
      "Navsari",
      "Okha",
      "Palanpur",
      "Patan",
      "Porbandar",
      "Rajkot",
      "Surat",
      "Surendranagar",
      "Valsad",
      "Veraval"
    ],
    "Haryana": [
      "Ambala",
      "Bhiwani",
      "Chandigarh",
      "Faridabad",
      "Firozpur Jhirka",
      "Gurugram",
      "Hansi",
      "Hisar",
      "Jind",
      "Kaithal",
      "Karnal",
      "Kurukshetra",
      "Panipat",
      "Pehowa",
      "Rewari",
      "Rohtak",
      "Sirsa",
      "Sonipat"
    ],
    "Himachal Pradesh": [
      "Bilaspur",
      "Chamba",
      "Dalhousie",
      "Dharmshala",
      "Hamirpur",
      "Kangra",
      "Kullu",
      "Mandi",
      "Nahan",
      "Shimla",
      "Una"
    ],
    "Jammu & Kashmir": [
      "Anantnag",
      "Baramula",
      "Doda",
      "Gulmarg",
      "Jammu",
      "Kathua",
      "Punch",
      "Rajouri",
      "Srinagar",
      "Udhampur"
    ],
    "Jharkhand": [
      "Bokaro",
      "Chaibasa",
      "Deoghar",
      "Dhanbad",
      "Dumka",
      "Giridih",
      "Hazaribag",
      "Jamshedpur",
      "Jharia",
      "Ranchi",
      "Saraikela"
    ],
    "Karnataka": [
      "Badami",
      "Ballari",
      "Bengaluru",
      "Belagavi",
      "Bhadravati",
      "Bidar",
      "Chikkamagaluru",
      "Chitradurga",
      "Davangere",
      "Halebid",
      "Hassan",
      "Hubballi-Dharwad",
      "Kalaburagi",
      "Kolar",
      "Madikeri",
      "Mandya",
      "Mangaluru",
      "Mysuru",
      "Raichur",
      "Shivamogga",
      "Shravanabelagola",
      "Shrirangapattana",
      "Tumakuru",
      "Vijayapura"
    ],
    "Kerala": [
      "Alappuzha",
      "Vatakara",
      "Idukki",
      "Kannur",
      "Kochi",
      "Kollam",
      "Kottayam",
      "Kozhikode",
      "Mattancheri",
      "Palakkad",
      "Thalassery",
      "Thiruvananthapuram",
      "Thrissur"
    ],
    "Ladakh": ["Kargil", "Leh"],
    "Madhya Pradesh": [
      "Balaghat",
      "Barwani",
      "Betul",
      "Bharhut",
      "Bhind",
      "Bhojpur",
      "Bhopal",
      "Burhanpur",
      "Chhatarpur",
      "Chhindwara",
      "Damoh",
      "Datia",
      "Dewas",
      "Dhar",
      "Dr. Ambedkar Nagar (Mhow)",
      "Guna",
      "Gwalior",
      "Hoshangabad",
      "Indore",
      "Itarsi",
      "Jabalpur",
      "Jhabua",
      "Khajuraho",
      "Khandwa",
      "Khargone",
      "Maheshwar",
      "Mandla",
      "Mandsaur",
      "Morena",
      "Murwara",
      "Narsimhapur",
      "Narsinghgarh",
      "Narwar",
      "Neemuch",
      "Nowgong",
      "Orchha",
      "Panna",
      "Raisen",
      "Rajgarh",
      "Ratlam",
      "Rewa",
      "Sagar",
      "Sarangpur",
      "Satna",
      "Sehore",
      "Seoni",
      "Shahdol",
      "Shajapur",
      "Sheopur",
      "Shivpuri",
      "Ujjain",
      "Vidisha"
    ],
    "Maharashtra": [
      "Ahmadnagar",
      "Akola",
      "Amravati",
      "Aurangabad",
      "Bhandara",
      "Bhusawal",
      "Bid",
      "Buldhana",
      "Chandrapur",
      "Daulatabad",
      "Dhule",
      "Jalgaon",
      "Kalyan",
      "Karli",
      "Kolhapur",
      "Mahabaleshwar",
      "Malegaon",
      "Matheran",
      "Mumbai",
      "Nagpur",
      "Nanded",
      "Nashik",
      "Osmanabad",
      "Pandharpur",
      "Parbhani",
      "Pune",
      "Ratnagiri",
      "Sangli",
      "Satara",
      "Sevagram",
      "Solapur",
      "Thane",
      "Ulhasnagar",
      "Vasai-Virar",
      "Wardha",
      "Yavatmal"
    ],
    "Manipur": ["Imphal"],
    "Meghalaya": ["Cherrapunji", "Shillong"],
    "Mizoram": ["Aizawl", "Lunglei"],
    "Nagaland": ["Kohima", "Mon", "Phek", "Wokha", "Zunheboto"],
    "Odisha": [
      "Balangir",
      "Baleshwar",
      "Baripada",
      "Bhubaneshwar",
      "Brahmapur",
      "Cuttack",
      "Dhenkanal",
      "Kendujhar",
      "Konark",
      "Koraput",
      "Paradip",
      "Phulabani",
      "Puri",
      "Sambalpur",
      "Udayagiri"
    ],
    "Puducherry": ["Karaikal", "Mahe", "Puducherry", "Yanam"],
    "Punjab": [
      "Amritsar",
      "Batala",
      "Chandigarh",
      "Faridkot",
      "Firozpur",
      "Gurdaspur",
      "Hoshiarpur",
      "Jalandhar",
      "Kapurthala",
      "Ludhiana",
      "Nabha",
      "Patiala",
      "Rupnagar",
      "Sangrur"
    ],
    "Rajasthan": [
      "Abu",
      "Ajmer",
      "Alwar",
      "Amer",
      "Barmer",
      "Beawar",
      "Bharatpur",
      "Bhilwara",
      "Bikaner",
      "Bundi",
      "Chittaurgarh",
      "Churu",
      "Dhaulpur",
      "Dungarpur",
      "Ganganagar",
      "Hanumangarh",
      "Jaipur",
      "Jaisalmer",
      "Jalor",
      "Jhalawar",
      "Jhunjhunu",
      "Jodhpur",
      "Kishangarh",
      "Kota",
      "Merta",
      "Nagaur",
      "Nathdwara",
      "Pali",
      "Phalodi",
      "Pushkar",
      "Sawai Madhopur",
      "Shahpura",
      "Sikar",
      "Sirohi",
      "Tonk",
      "Udaipur"
    ],
    "Sikkim": ["Gangtok", "Gyalshing", "Lachung", "Mangan"],
    "Tamil Nadu": [
      "Arcot",
      "Chengalpattu",
      "Chennai",
      "Chidambaram",
      "Coimbatore",
      "Cuddalore",
      "Dharmapuri",
      "Dindigul",
      "Erode",
      "Kanchipuram",
      "Kanniyakumari",
      "Kodaikanal",
      "Kumbakonam",
      "Madurai",
      "Mamallapuram",
      "Nagappattinam",
      "Nagercoil",
      "Palayamkottai",
      "Pudukkottai",
      "Rajapalaiyam",
      "Ramanathapuram",
      "Salem",
      "Thanjavur",
      "Tiruchchirappalli",
      "Tirunelveli",
      "Tiruppur",
      "Tuticorin",
      "Udhagamandalam",
      "Vellore"
    ],
    "Telangana": [
      "Hyderabad",
      "Karimnagar",
      "Khammam",
      "Mahbubnagar",
      "Nizamabad",
      "Sangareddy",
      "Warangal"
    ],
    "Tripura": ["Agartala"],
    "Uttar Pradesh": [
      "Agra",
      "Aligarh",
      "Amroha",
      "Ayodhya",
      "Azamgarh",
      "Bahraich",
      "Ballia",
      "Banda",
      "Bara Banki",
      "Bareilly",
      "Basti",
      "Bijnor",
      "Bithur",
      "Budaun",
      "Bulandshahr",
      "Deoria",
      "Etah",
      "Etawah",
      "Faizabad",
      "Farrukhabad",
      "Fatehpur",
      "Firozabad",
      "Ghaziabad",
      "Ghazipur",
      "Gonda",
      "Gorakhpur",
      "Hamirpur",
      "Hardoi",
      "Hathras",
      "Jalaun",
      "Jaunpur",
      "Jhansi",
      "Kannauj",
      "Kanpur",
      "Kasganj",
      "Kaushambi",
      "Kheri",
      "Kushinagar",
      "Lakhimpur",
      "Lalitpur",
      "Lucknow",
      "Mahoba",
      "Mathura",
      "Meerut",
      "Mirzapur",
      "Moradabad",
      "Muzaffarnagar",
      "Noida",
      "Orai",
      "Padrauna",
      "Pilibhit",
      "Pratapgarh",
      "Rae Bareli",
      "Rampur",
      "Saharanpur",
      "Sambhal",
      "Shahjahanpur",
      "Sitapur",
      "Sonbhadra",
      "Sultanpur",
      "Tehri",
      "Varanasi"
    ],
    "Uttarakhand": [
      "Almora",
      "Dehra Dun",
      "Haridwar",
      "Mussoorie",
      "Nainital",
      "Pithoragarh",
      "Roorkee",
      "Rudra Prayag",
      "Tehri",
      "Uttarkashi"
    ],
    "West Bengal": [
      "Alipore",
      "Alipur Duar",
      "Asansol",
      "Baharampur",
      "Bally",
      "Balurghat",
      "Bankura",
      "Baranagar",
      "Barasat",
      "Barrackpore",
      "Basirhat",
      "Bhatpara",
      "Bishnupur",
      "Budge Budge",
      "Burdwan",
      "Chandannagar",
      "Cooch Behar",
      "Darjiling",
      "Diamond Harbour",
      "Dum Dum",
      "Durgapur",
      "Halisahar",
      "Haora",
      "Hugli",
      "Ingraj Bazar",
      "Jalpaiguri",
      "Kalimpong",
      "Kamarhati",
      "Kanchrapara",
      "Kharagpur",
      "Koch Bihar",
      "Kolkata",
      "Krishnanagar",
      "Malda",
      "Midnapore",
      "Murshidabad",
      "Navadwip",
      "Palashi",
      "Panihati",
      "Purulia",
      "Raiganj",
      "Santipur",
      "Shantiniketan",
      "Shrirampur",
      "Siliguri",
      "Siuri",
      "Tamluk"
    ]
  };

  // ignore: non_constant_identifier_names
  bool CitizenTnC = false;

  @override
  void initState() {
    super.initState();
    selectedState = dropdownItemState.first;
    updateCityList(selectedState);
    //status bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white12, // Change this color to the desired color
        statusBarIconBrightness: Brightness.light, // Change the status bar icons' color
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                const SizedBox(height: 30),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      padding: EdgeInsets.only(
                          //for fields that are covered under keyboard
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                          left: 16,
                          right: 16),
                      child: Column(
                        children: [
                          const Text(
                            "Create your Account here : ",
                            style: TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 9),
                          // const Text("Connect with your city now !",),
                          const SizedBox(height: 50),
                          SvgPicture.asset(svg_for_login),
                          const SizedBox(height: 36),
                          //fname lname
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      controller: fnameTextController,
                                      decoration: const InputDecoration(
                                        hintText: "First Name",
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 18,
                                        ),
                                        filled: true,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter first name';
                                        }
                                        if (value.isNotEmpty &&
                                            value.length < 3) {
                                          return "Minimum 3 Characters required";
                                        }
                                        return null; // Return null if the input is valid
                                      },
                                      onEditingComplete: () {
                                        // Move focus to the next field when "Enter" is pressed
                                        FocusScope.of(context).nextFocus();
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      controller: lnameTextController,
                                      decoration: const InputDecoration(
                                        hintText: "Last Name",
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 18,
                                        ),
                                        filled: true,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter last name';
                                        }
                                        if (value.isNotEmpty &&
                                            value.length < 3) {
                                          return 'Minimum 3 Characters';
                                        }
                                        return null; // Return null if the input is valid
                                      },
                                      onEditingComplete: () {
                                        // Move focus to the next field when "Enter" is pressed
                                        FocusScope.of(context).nextFocus();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 13),
                          //gender
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 11),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 2),
                                  child: CustomRadioButton(
                                    text: "Male",
                                    value: genderList[0],
                                    groupValue: genderRadio,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 1),
                                    onChange: (value) {
                                      // Update the state when a radio button is selected
                                      setState(() {
                                        genderRadio = value;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, bottom: 2),
                                  child: CustomRadioButton(
                                    text: "Female",
                                    value: genderList[1],
                                    groupValue: genderRadio,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 1),
                                    onChange: (value) {
                                      // Update the state when a radio button is selected
                                      setState(() {
                                        genderRadio = value;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 28, top: 0),
                                  child: CustomRadioButton(
                                    text: "Others",
                                    value: genderList[2],
                                    groupValue: genderRadio,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 1),
                                    onChange: (value) {
                                      // Update the state when a radio button is selected
                                      setState(() {
                                        genderRadio = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // ignore: unnecessary_null_comparison
                          if (showErrorTnC)
                            const Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Please select your gender',
                                  style: TextStyle(
                                      color: Color(0xFFB71C1C),
                                      fontSize: 10,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            ),
                          const SizedBox(height: 11),
                          //phone
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: TextFormField(
                              maxLength: 10,
                              controller: phoneTextController,
                              decoration: InputDecoration(
                                prefixText: "+91 ",
                                hintText: "Enter your Mobile number",
                                prefixIcon: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 16, 12, 16),
                                  child: SvgPicture.asset(svg_for_call),
                                ),
                                prefixIconConstraints: const BoxConstraints(
                                  maxHeight: 56,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter mobile no';
                                }
                                if (value.length < 10) {
                                  return 'Mobile no should be of 10 digits';
                                }
                                return null; // Return null if the input is valid
                              },
                              onEditingComplete: () {
                                // Move focus to the next field when "Enter" is pressed
                                FocusScope.of(context).nextFocus();
                              },
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          const SizedBox(height: 8),
                          //date
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                _selectDate(context);
                              },
                              child: AbsorbPointer(
                                child: TextFormField(
                                  controller: birthDateTextController,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    hintText: "Select your Birthdate",
                                    prefixIcon: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 16, 12, 16),
                                      child: SvgPicture.asset(svg_for_calendar),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Select Birth date';
                                    }
                                    return null; // Return null if the input is valid
                                  },
                                  onEditingComplete: () {
                                    // Move focus to the next field when "Enter" is pressed
                                    FocusScope.of(context).nextFocus();
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          //state
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                    right: 5,
                                  ),
                                  child: SizedBox(
                                    //height: 60,
                                    child: DropdownButtonFormField<String>(
                                      value: selectedState,
                                      items:
                                          dropdownItemState.map((String state) {
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
                              left: 5,
                              right: 5,
                            ),
                            child: SizedBox(
                              //height: 60,
                              child: DropdownButtonFormField<String>(
                                value: selectedCity.isNotEmpty
                                    ? selectedCity
                                    : null,
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Select your City';
                                  }
                                  return null; // Return null if the input is valid
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          //pin
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: TextFormField(
                              maxLength: 6,
                              controller: pinCodeTextController,
                              decoration: const InputDecoration(
                                hintText: "Enter your Pin Code",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter zip code';
                                }
                                if (value.length < 6) {
                                  return 'Enter 6 digits Pin code';
                                }
                                return null; // Return null if the input is valid
                              },
                              onEditingComplete: () {
                                // Move focus to the next field when "Enter" is pressed
                                FocusScope.of(context).nextFocus();
                              },
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          const SizedBox(height: 12),
                          //address
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: TextFormField(
                              textCapitalization: TextCapitalization.sentences,
                              controller: fullAddressTextController,
                              decoration: const InputDecoration(
                                hintText: "Enter your full address",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              maxLength: 150,
                              maxLines: 4,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your full address';
                                }
                                if (value.length < 10) {
                                  return 'Too short address';
                                }
                                return null; // Return null if the input is valid
                              },
                              onEditingComplete: () {
                                // Move focus to the next field when "Enter" is pressed
                                FocusScope.of(context).nextFocus();
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          //t&c
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 3,
                                right: 100,
                              ),
                              child: CustomCheckboxButton(
                                alignment: Alignment.centerLeft,
                                text: "I accept term & conditions",
                                value: CitizenTnC,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 1),
                                onChange: (value) {
                                  setState(() {
                                    CitizenTnC = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //Out of scrollview
                const SizedBox(height: 9),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    width: double.infinity,
                    child: ClipRRect(
                        child: ElevatedButton(
                            onPressed: () async {
                              //Circular Progress Bar
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.white),
                                  );
                                },
                              );
                              await Future.delayed(
                                  const Duration(milliseconds: 1200));
                              Navigator.pop(context);



                              if (!CitizenTnC) {
                                final tnCError = SnackBar(
                                  dismissDirection: DismissDirection.vertical,
                                  elevation: 35,
                                  padding: const EdgeInsets.all(7),
                                  content: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                        'Please accept terms & conditions..'),
                                  ),
                                  duration: const Duration(seconds: 3),
                                  // Duration for which SnackBar will be visible
                                  action: SnackBarAction(
                                    label: 'Hide',
                                    onPressed: () {
                                      // Undo functionality
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                    },
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(tnCError);
                              }

                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  showErrorTnC = genderRadio == null;
                                });
                                if (!CitizenTnC) {
                                  return;
                                } else {
                                  String dateString =
                                      birthDateTextController.text;
                                  DateTime birthDate = DateFormat('MMM d, yyyy')
                                      .parse(dateString);

                                  //Storing data to database
                                  UserRegistration userData = UserRegistration(
                                    firstName: fnameTextController.text,
                                    lastName: lnameTextController.text,
                                    gender: genderRadio ?? "",
                                    // Assuming genderRadio is nullable String
                                    phoneNumber: phoneTextController.text,
                                    birthDate: birthDate,
                                    state: selectedState,
                                    city: selectedCity,
                                    pinCode: pinCodeTextController.text,
                                    fullAddress: fullAddressTextController.text,
                                    termsAccepted: CitizenTnC,
                                  );

                                  // Convert the object to JSON
                                  Map<String, dynamic> userDataJson =
                                      userData.toJson();

                                  // Store data in Firestore
                                  try {
                                    DocumentReference docRef =
                                        await FirebaseFirestore.instance
                                            .collection("Citizens")
                                            .add(userDataJson);

                                    // Document successfully added
                                    if (kDebugMode) {
                                      print(
                                          'Document added with ID: ${docRef.id}');
                                    }
                                    // Show a toast message upon success
                                    Fluttertoast.showToast(
                                        msg: "Citizen Account Created ..",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );

                                    // Navigate to a new page upon success
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            const EntryPoint(),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          var begin = const Offset(1.0, 0.0);
                                          var end = Offset.zero;
                                          var curve = Curves.ease;

                                          var tween = Tween(
                                                  begin: begin, end: end)
                                              .chain(CurveTween(curve: curve));
                                          var offsetAnimation =
                                              animation.drive(tween);
                                          //slight fade effect
                                          var opacityAnimation = animation.drive(tween);

                                          return SlideTransition(
                                            position: offsetAnimation,
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  } catch (e) {
                                    // An error occurred
                                    if (kDebugMode) {
                                      print(
                                          'Error adding citizen document: $e');
                                    }
                                  }

                                  if (kDebugMode) {
                                    print(
                                        "Citizen Stored and Registered successfully [(:-==-:)]");
                                  }
                                }
                              }
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)))),
                            child: const Text("Continue"))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Already have an account  ? ",
                      ),
                      SizedBox(
                        height: 35,
                        width: 89,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CitizenLoginScreen(),
                                          ));
                                    },
                                    // style: TextButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.25)),
                                    child: const Text(
                                      "Login ..",
                                      // selectionColor: Colors.blueGrey,
                                    ))),
                            SvgPicture.asset(svg_for_line, width: 65),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    // ignore: unrelated_type_equality_checks
    if (pickedDate != null && pickedDate != birthDateTextController.text) {
      final formattedDate = DateFormat.yMMMd()
          .format(pickedDate); // Format date to show day, month, year
      setState(() {
        birthDateTextController.text = formattedDate;
      });
    }
  }

  void updateCityList(String state) {
    setState(() {
      dropdownItemCity = cityMap[state] ?? [];
    });
  }

// /// Section Widget
// Widget _buildGroup38RadioGroup(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.only(left: 8.h, right: 11.h),
//     child: Row(
//       children: [
//         Padding(
//           padding: EdgeInsets.only(bottom: 2.v),
//           child: CustomRadioButton(
//             text: "male",
//             value: radioList[0],
//             groupValue: radioGroup,
//             padding: EdgeInsets.symmetric(vertical: 1.v),
//             onChange: (value) {
//               // Update the state when a radio button is selected
//               setState(() {
//                 radioGroup = value;
//               });
//             },
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 24.h, bottom: 2.v),
//           child: CustomRadioButton(
//             text: "female",
//             value: radioList[1],
//             groupValue: radioGroup,
//             padding: EdgeInsets.symmetric(vertical: 1.v),
//             onChange: (value) {
//               // Update the state when a radio button is selected
//               setState(() {
//                 radioGroup = value;
//               });
//             },
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 28.h, top: 2.v),
//           child: CustomRadioButton(
//             text: "others",
//             value: radioList[2],
//             groupValue: radioGroup,
//             padding: EdgeInsets.symmetric(vertical: 1.v),
//             onChange: (value) {
//               // Update the state when a radio button is selected
//               setState(() {
//                 radioGroup = value;
//               });
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// /// Section Widget
// Widget _buildPhoneNumberEditText(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.only(
//       left: 3.h,
//       right: 5.h,
//     ),
//     child: CustomTextFormField(
//       controller: phoneNumberEditTextController,
//       hintText: "Phone Number",
//       textInputType: TextInputType.phone,
//       prefix: Container(
//         margin: EdgeInsets.fromLTRB(20.h, 16.v, 12.h, 16.v),
//         child: CustomImageView(
//           imagePath: ImageConstant.imgCall,
//           height: 24.adaptSize,
//           width: 24.adaptSize,
//         ),
//       ),
//       prefixConstraints: BoxConstraints(
//         maxHeight: 56.v,
//       ),
//     ),
//   );
// }

// // Section Widget
// Widget _buildDateEditText(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.only(
//       left: 3,
//       right: 5,
//     ),
//     child: GestureDetector(
//       onTap: () {
//         _selectDate(context);
//       },
//       child: AbsorbPointer(
//         child: TextFormField(
//           controller: dateEditTextController,
//           readOnly: true,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(4.h),
//               borderSide: BorderSide(
//                 color: appTheme.gray500,
//                 width: 1,
//               ),
//             ),
//             hintText: "Birthdate",
//             prefixIcon: Container(
//               margin: EdgeInsets.fromLTRB(20.h, 16.v, 12.h, 16.v),
//               child: SvgPicture.asset(ImageConstant.imgCalendar),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
// /// Section Widget
// Widget _buildZipcodeEditText(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.only(
//       left: 3.h,
//       right: 4.h,
//     ),
//     child: CustomTextFormField(
//       controller: zipcodeEditTextController,
//       hintText: "Zip Code",
//       textInputType: TextInputType.number,
//       contentPadding: EdgeInsets.symmetric(
//         horizontal: 20.h,
//         vertical: 18.v,
//       ),
//     ),
//   );
// }
// /// Section Widget
// Widget _buildFieldsColumn(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.only(
//       left: 0,
//       right: 0,
//     ),
//     child: Column(
//       children: [
//         _buildAddressEditText(context),
//       ],
//     ),
//   );
// }
// /// Section Widget
// Widget _buildAddressEditText(BuildContext context) {
//   return CustomTextFormField(
//     controller: addressEditTextController,
//     hintText: "Address",
//     textInputAction: TextInputAction.done,
//     suffix: Container(
//       margin: EdgeInsets.only(
//         left: 30,
//         top: 30,
//       ),
//       child: CustomImageView(
//         imagePath: ImageConstant.imgSettings,
//         height: 24.adaptSize,
//         width: 24.adaptSize,
//       ),
//     ),
//     suffixConstraints: BoxConstraints(
//       maxHeight: 120,
//     ),
//     maxLines: 3,
//     contentPadding: EdgeInsets.symmetric(
//       horizontal: 20,
//       vertical: 18,
//     ),
//   );
// }
// // Section Widget
// Widget _buildCheckboxCheckBox(BuildContext context) {
//   return Align(
//     alignment: Alignment.centerLeft,
//     child: Padding(
//       padding: EdgeInsets.only(
//         left: 3.h,
//         right: 67.h,
//       ),
//       child: CustomCheckboxButton(
//         alignment: Alignment.centerLeft,
//         text: "I accept term & conditions",
//         value: checkboxCheckBox,
//         padding: EdgeInsets.symmetric(vertical: 1.v),
//         onChange: (value) {
//           checkboxCheckBox = value;
//         },
//       ),
//     ),
//   );
// }
// // Section Widget
// Widget _buildSignUpButton(BuildContext context) {
//   return ElevatedButton(
//     onPressed: () {
//       // if (_formKey.currentState!.validate()) {
//       //   // Form is valid, do something
//       // } else {
//       //   // Find the first field with an error and move focus to it
//       //   if (_firstNameFocusNode.hasFocus &&
//       //       createCitizenAccountTextController.text.isEmpty) {
//       //     FocusScope.of(context).requestFocus(_firstNameFocusNode);
//       //   } else if (_lastNameFocusNode.hasFocus &&
//       //       connectWithYourTextController.text.isEmpty) {
//       //     FocusScope.of(context).requestFocus(_lastNameFocusNode);
//       //   }
//       // }
//     },
//     child: Text('Submit'),
//   );
// }
}

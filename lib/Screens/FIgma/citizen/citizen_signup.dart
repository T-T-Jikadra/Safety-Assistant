import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
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

class _CitizenSignupPageScreenState
    extends State<CitizenSignupPageScreen> {
  TextEditingController createCitizenAccountTextController =
      TextEditingController();
  TextEditingController phoneNumberEditTextController = TextEditingController();
  TextEditingController connectWithYourTextController = TextEditingController();
  TextEditingController dateEditTextController = TextEditingController();
  TextEditingController zipcodeEditTextController = TextEditingController();
  TextEditingController addressEditTextController = TextEditingController();

  String radioGroup = "";

  String selectedState = '';

  List<String> radioList = ["lbl_male", "lbl_female", "lbl_others"];

  List<String> dropdownItemList1 = [
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

  List<String> dropdownItemList2 = [];

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

  @override
  void initState() {
    super.initState();
    selectedState = dropdownItemList1.first;
    updateCityList(selectedState);
  }

  void updateCityList(String state) {
    setState(() {
      dropdownItemList2 = cityMap[state] ?? [];
    });
  }

  // ignore: non_constant_identifier_names
  bool CitizenTnC = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();

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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const Text(
                            "Create Citizen Account :",
                            style: TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 9),
                          const Text(
                            "Connect with your city now !",
                          ),
                          const SizedBox(height: 50),
                          SvgPicture.asset(svg_for_login),
                          const SizedBox(height: 36),
                          //fname lname
                          Padding(
                            padding: const EdgeInsets.only(left: 3, right: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: TextFormField(
                                      focusNode: _firstNameFocusNode,
                                      controller:
                                          createCitizenAccountTextController,
                                      decoration: const InputDecoration(
                                        hintText: "First Name",
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 18,
                                        ),
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: TextFormField(
                                      focusNode: _lastNameFocusNode,
                                      controller: connectWithYourTextController,
                                      decoration: InputDecoration(
                                        hintText: "Last Name",
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 18,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                          // Replace with your desired border style
                                          borderRadius: BorderRadius.circular(
                                              4), // Replace with your desired border radius
                                        ),
                                        filled: true,
                                        // fillColor: Colors.deepPurple,
                                      ),
                                      // validator: (value){
                                      //   if (value == null || value.isEmpty) {
                                      //     FocusScope.of(context).requestFocus(_lastNameFocusNode);
                                      //
                                      //     return 'Please enter last name';
                                      //
                                      //   }
                                      //   return null;
                                      // },
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
                                    value: radioList[0],
                                    groupValue: radioGroup,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 1),
                                    onChange: (value) {
                                      // Update the state when a radio button is selected
                                      setState(() {
                                        radioGroup = value;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, bottom: 2),
                                  child: CustomRadioButton(
                                    text: "Female",
                                    value: radioList[1],
                                    groupValue: radioGroup,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 1),
                                    onChange: (value) {
                                      // Update the state when a radio button is selected
                                      setState(() {
                                        radioGroup = value;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 28, top: 0),
                                  child: CustomRadioButton(
                                    text: "Others",
                                    value: radioList[2],
                                    groupValue: radioGroup,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 1),
                                    onChange: (value) {
                                      // Update the state when a radio button is selected
                                      setState(() {
                                        radioGroup = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 11),
                          //phone
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                              right: 0,
                            ),
                            child: TextFormField(
                              maxLength: 10,
                              controller: phoneNumberEditTextController,
                              decoration: InputDecoration(
                                prefixText: "+91 ",
                                hintText: "Enter Mobile Number",
                                prefixIcon: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 16, 12, 16),
                                  child: SvgPicture.asset(svg_for_call),
                                ),
                                prefixIconConstraints: const BoxConstraints(
                                  maxHeight: 56,
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          const SizedBox(height: 8),
                          //date
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                              right: 0,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                _selectDate(context);
                              },
                              child: AbsorbPointer(
                                child: TextFormField(
                                  controller: dateEditTextController,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    hintText: "Birthdate",
                                    prefixIcon: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 16, 12, 16),
                                      child: SvgPicture.asset(svg_for_calendar),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          //state
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                              right: 0,
                            ),
                            child: Expanded(
                              child: DropdownButtonFormField<String>(
                                value: selectedState,
                                items: dropdownItemList1.map((String state) {
                                  return DropdownMenuItem<String>(
                                    // alignment: AlignmentDirectional.topStart,
                                    value: state,
                                    child: Text(state),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedState = value!;
                                    updateCityList(selectedState);
                                  });
                                },
                                decoration: const InputDecoration(
                                  // border: OutlineInputBorder(),
                                  hintText: "Select your State",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          //city
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                              right: 0,
                            ),
                            child: DropdownButtonFormField<String>(
                              value: dropdownItemList2.isNotEmpty
                                  ? dropdownItemList2.first
                                  : null,
                              items: dropdownItemList2.map((String city) {
                                return DropdownMenuItem<String>(
                                  value: city,
                                  child: Text(city),
                                );
                              }).toList(),
                              onChanged: (value) {},
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Select your City",
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          //zip
                          TextFormField(
                            maxLength: 6,
                            controller: zipcodeEditTextController,
                            decoration: const InputDecoration(
                              hintText: "Enter your Zip Code / Pin Code",
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 18,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: addressEditTextController,
                            decoration: const InputDecoration(
                              hintText: "Enter your address",
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 18,
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            maxLength: 150,
                            maxLines: 4,
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
                const SizedBox(height: 9),
                Padding(
                  padding: const EdgeInsets.only(right: 7,left: 7),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    width: double.infinity,
                    child: ClipRRect(
                      // borderRadius: BorderRadius.circular(50),
                        child: ElevatedButton(
                            onPressed: () {
                              // Navigate based on selected role
                              final snackBar = SnackBar(
                                dismissDirection: DismissDirection.vertical,
                                elevation: 35,
                                padding: const EdgeInsets.all(7),
                                content: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Under Construction..'),
                                ),
                                duration: const Duration(seconds: 3),
                                // Duration for which SnackBar will be visible
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    // Undo functionality
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(18)))),
                            child: const Text("Continue .."))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Already have an account? ",
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
    if (pickedDate != null && pickedDate != dateEditTextController.text) {
      final formattedDate = DateFormat.yMMMd()
          .format(pickedDate); // Format date to show day, month, year
      setState(() {
        dateEditTextController.text = formattedDate;
      });
    }
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

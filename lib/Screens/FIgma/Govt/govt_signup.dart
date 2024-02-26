import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Utils/constants.dart';
import '../citizen/custom_checkbox_button.dart';
import 'govt_login.dart';

// ignore: must_be_immutable
class GovtSignupPageScreen extends StatefulWidget {
  const GovtSignupPageScreen({Key? key})
      : super(
    key: key,
  );

  @override
  State<GovtSignupPageScreen> createState() => _GovtSignupPageScreenState();
}

class _GovtSignupPageScreenState extends State<GovtSignupPageScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameOfNGOTextController = TextEditingController();
  TextEditingController regNoTextController = TextEditingController();
  TextEditingController dateEditTextController = TextEditingController();
  TextEditingController contactNoTextController = TextEditingController();
  TextEditingController emailIdTextController = TextEditingController();
  TextEditingController websiteURLTextController = TextEditingController();
  TextEditingController zipCodeTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController pwdTextController = TextEditingController();
  TextEditingController confirmPwdTextController = TextEditingController();

  String selectedState = '';

  List<String> dropdownItemState = [
    "Select Govt Agency State",
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

  @override
  void initState() {
    super.initState();
    selectedState = dropdownItemState.first;
    updateCityList(selectedState);
  }

  // ignore: non_constant_identifier_names
  bool GovtTnC = false;
  bool _obscurePwdText = true;
  bool _obscureConfirmPwdText = true;

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
                const SizedBox(height: 25),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      padding: EdgeInsets.only(
                        //for fields that are covered under keyboard
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                          left: 16,
                          right: 16),
                      //padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const Text(
                            "Create your Account here : ",
                            style: TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 9),
                          // const Text("Connect with your city now !",),
                          const SizedBox(height: 50),
                          SvgPicture.asset(svg_for_signup),
                          const SizedBox(height: 30),
                          //govt name
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              focusNode: _firstNameFocusNode,
                              controller: nameOfNGOTextController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.account_box_outlined,
                                    color: Colors.deepPurple),
                                hintText: "Enter name of Government Agency",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                                filled: true,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Govt Agency name';
                                }
                                if (value.isNotEmpty && value.length < 2) {
                                  return 'Minimum 3 Characters required';
                                }
                                return null; // Return null if the input is valid
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          //govt reg no
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              focusNode: _lastNameFocusNode,
                              controller: regNoTextController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.app_registration,
                                    color: Colors.deepPurple),
                                hintText: "Enter registration no. of Govt. Agency",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                                filled: true,
                                // fillColor: Colors.deepPurple,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Registration No';
                                }
                                if (value.isNotEmpty && value.length < 2) {
                                  return 'Minimum 3 Characters required';
                                }
                                return null; // Return null if the input is valid
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          //govt services
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: TextFormField(
                              onTap: () {
                                _showCupertinoDialog(context);
                              },
                              controller: dateEditTextController,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: "Select Services Govt. can provide",
                                prefixIcon: Container(
                                  margin:
                                  const EdgeInsets.fromLTRB(20, 16, 12, 16),
                                  child: SvgPicture.asset(svg_for_calendar),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Select your serving Services from list';
                                }
                                // if (value.isNotEmpty && value.length < 2) {
                                //   return 'Minimum 3 Characters';
                                // }
                                return null; // Return null if the input is valid
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          //govt contact
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: TextFormField(
                              maxLength: 10,
                              controller: contactNoTextController,
                              decoration: InputDecoration(
                                //prefixText: "+91 ",
                                hintText: "Enter contact number of Govt. Agency",
                                prefixIcon: Container(
                                  decoration: const BoxDecoration(
                                    //borderRadius: BorderRadius.all(Radius.circular(30)),
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Telephone number';
                                }
                                if (value.isNotEmpty && value.length < 2) {
                                  return 'Minimum no should be of 10 digits';
                                }
                                return null; // Return null if the input is valid
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          //govt email
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              controller: emailIdTextController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined,
                                    color: Colors.deepPurple),
                                hintText: "Enter authorized mail id of Govt. Agency",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter an email address';
                                }
                                // Regular expression for validating an email address
                                final emailRegex = RegExp(r'^[\w.-]+@([\w-]+\.)+[\w-]{2,4}$');
                                if (!emailRegex.hasMatch(value)) {
                                  return 'Enter valid email address';
                                }
                                return null; // Return null if the input is valid
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          //govt website
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              controller: websiteURLTextController,
                              decoration: const InputDecoration(
                                prefixIcon:
                                Icon(Icons.web, color: Colors.deepPurple),
                                hintText: "Enter website URL of Govt. Agency",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                              ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter website URL';
                                  }
                                  // Regular expression for validating a URL
                                  final urlRegex = RegExp(
                                    r'^(https?://)?'
                                    r'([a-z0-9-]+\.)*[a-z0-9-]+'
                                    r'\.[a-z]{2,}(\/\S*)?$',
                                    caseSensitive: false,
                                  );
                                  if (!urlRegex.hasMatch(value)) {
                                    return 'Enter valid URL';
                                  }
                                  return null; // Return null if the input is valid
                                },
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
                                    height: 60,
                                    child: DropdownButtonFormField<String>(
                                        value: selectedState,
                                        items: dropdownItemState.map((String state) {
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
                                          hintText: "Select Govt Agency State",
                                        ),
                                        validator: (value) {
                                          if (value == "Select Govt Agency State") {
                                            return 'Select Govt Agency State';
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
                              height: 60,
                              child: DropdownButtonFormField<String>(
                                value: dropdownItemCity.isNotEmpty
                                    ? dropdownItemCity.first
                                    : null,
                                items: dropdownItemCity.map((String city) {
                                  return DropdownMenuItem<String>(
                                    value: city,
                                    child: Text(city),
                                  );
                                }).toList(),
                                onChanged: (value) {},
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Select Govt Agency City",
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Select Govt Agency City';
                                  }
                                  return null; // Return null if the input is valid
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          //pin
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              maxLength: 6,
                              controller: zipCodeTextController,
                              decoration: const InputDecoration(
                                hintText: "Enter Pin code of Govt. Agency",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter zip code';
                                }
                                if (value.isNotEmpty || value.length < 6) {
                                  return 'Enter 6 digits Zip code';
                                }
                                return null; // Return null if the input is valid
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          //address
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              controller: addressTextController,
                              decoration: const InputDecoration(
                                hintText: "Enter full address of Govt. Agency",
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
                                  return 'Enter your address';
                                }
                                if (value.isNotEmpty || value.length < 10) {
                                  return 'Enter your full address';
                                }
                                return null; // Return null if the input is valid
                              },
                            ),
                          ),
                          const SizedBox(height: 31),
                          //pwd
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              controller: pwdTextController,
                              obscureText: _obscurePwdText,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.deepPurple,
                                ),
                                hintText: "Create password for Govt Agency",
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscurePwdText = !_obscurePwdText;
                                    });
                                  },
                                  child: Icon(
                                    _obscurePwdText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              validator: _validatePassword,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Confirm pwd
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              controller: confirmPwdTextController,
                              obscureText: _obscureConfirmPwdText,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.deepPurple,
                                ),
                                hintText: "Confirm password",
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureConfirmPwdText =
                                      !_obscureConfirmPwdText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureConfirmPwdText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter confirm password';
                                }
                                if (value!=pwdTextController.text) {
                                  return "Confirm password doesn't matches";
                                }
                                return null; // Return null if the input is valid
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
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
                                value: GovtTnC,
                                padding:
                                const EdgeInsets.symmetric(vertical: 1),
                                onChange: (value) {
                                  setState(() {
                                    GovtTnC = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          //btn
                          //const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
                //out of scrollbar
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    width: double.infinity,
                    child: ClipRRect(
                      // borderRadius: BorderRadius.circular(50),
                        child: ElevatedButton(
                            onPressed: () {
                              if (!GovtTnC) {
                                final tnCError = SnackBar(
                                  dismissDirection: DismissDirection.vertical,
                                  elevation: 35,
                                  padding: const EdgeInsets.all(7),
                                  content: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Please accept terms & conditions..'),
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
                                ScaffoldMessenger.of(context).showSnackBar(tnCError);
                              }

                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, you can proceed with form submission
                                // For example, you can save the form data or navigate to the next screen
                                // If you need to access the form field values, you can use the controller
                                // For example: fnameTextController.text
                              }
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
                                            const GovtLoginPageScreen(),
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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null; // Return null if the password passes all validations
  }

  void _showCupertinoDialog(BuildContext context) {
    List<String> listOfServices = [
      "Mass Human Rescue",
      "Provision Temporary Shelter / Relocation",
      "Provision Emergency Health Care",
      "Provision Food and Water",
      "Provision against fire break out",
      "Repairing vital services (Telecommunication)",
      "Repairing vital services (Transportation)",
      "Repairing vital services (Electricity)",
      "Animal Rescue"
    ];
    List<bool> checked = List.filled(listOfServices.length, false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select your services from the list :'),
          content: SizedBox(
            width: double.maxFinite,
            height: 300, // Adjust the height as needed
            child: ListView.builder(
              itemCount: listOfServices.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      checked[index] = !checked[index];
                    });
                  },
                  child: ListTile(
                    title: Text(listOfServices[index]),
                    trailing: CupertinoSwitch(
                      value: checked[index],
                      onChanged: (bool value) {
                        setState(() {
                          checked[index] = value;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String selectedOptions = '';
                for (int i = 0; i < listOfServices.length; i++) {
                  if (checked[i]) {
                    selectedOptions += '${listOfServices[i]}, ';
                  }
                }
                if (selectedOptions.isNotEmpty) {
                  selectedOptions = selectedOptions.substring(
                      0, selectedOptions.length - 2);
                }
                dateEditTextController.text = selectedOptions;
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void updateCityList(String state) {
    setState(() {
      dropdownItemCity = cityMap[state] ?? [];
    });
  }

// void _showCupertinoDialog(BuildContext context) {
//   List<String> options = ['Option 1', 'Option 2', 'Option 3']; // Your list of options
//   List<bool> checked = List.filled(options.length, false);
//
//   showCupertinoModalPopup(
//     context: context,
//     builder: (BuildContext context) {
//       return CupertinoAlertDialog(
//         title: const Text('Select Options'),
//         content: Column(
//           children: List.generate(
//             options.length,
//                 (index) {
//               return CheckboxListTile(
//                 title: Text(options[index]),
//                 value: checked[index],
//                 onChanged: (bool? value) {
//                   if (value != null) {
//                     checked[index] = value;
//                   }
//                   setState(() {}); // Update dialog to reflect changes
//                 },
//               );
//             },
//           ),
//         ),
//         actions: <Widget>[
//           CupertinoDialogAction(
//             child: const Text('Cancel'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           CupertinoDialogAction(
//             child: const Text('OK'),
//             onPressed: () {
//               String selectedOptions = '';
//               for (int i = 0; i < options.length; i++) {
//                 if (checked[i]) {
//                   selectedOptions += options[i] + ', ';
//                 }
//               }
//               if (selectedOptions.isNotEmpty) {
//                 selectedOptions = selectedOptions.substring(0, selectedOptions.length - 2);
//               }
//               dateEditTextController.text = selectedOptions;
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

// Future<void> _selectDate(BuildContext context) async {
//   final DateTime? pickedDate = await showDatePicker(
//     context: context,
//     initialDate: DateTime.now(),
//     firstDate: DateTime(1900),
//     lastDate: DateTime.now(),
//     builder: (BuildContext context, Widget? child) {
//       return Theme(
//         data: ThemeData.light().copyWith(
//           colorScheme: const ColorScheme.light(
//             primary: Colors.blue, // Header background color
//             onPrimary: Colors.white, // Header text color
//             onSurface: Colors.black, // Body text color
//           ),
//           textButtonTheme: TextButtonThemeData(
//             style: TextButton.styleFrom(
//               foregroundColor: Colors.blue, // Button text color
//             ),
//           ),
//         ),
//         child: child!,
//       );
//     },
//   );
//   // ignore: unrelated_type_equality_checks
//   if (pickedDate != null && pickedDate != dateEditTextController.text) {
//     final formattedDate = DateFormat.yMMMd()
//         .format(pickedDate); // Format date to show day, month, year
//     setState(() {
//       dateEditTextController.text = formattedDate;
//     });
//   }
// }

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

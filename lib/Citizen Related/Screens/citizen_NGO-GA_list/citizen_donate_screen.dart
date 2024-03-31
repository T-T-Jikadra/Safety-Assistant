// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Citizen_Donate_Screen extends StatefulWidget {
  final String authority_name;
  final String authority_id;
  final String authority_email;

  const Citizen_Donate_Screen(
      {super.key,
      required this.authority_name,
      required this.authority_id,
      required this.authority_email});

  @override
  State<Citizen_Donate_Screen> createState() => _Citizen_Donate_ScreenState();
}

class _Citizen_Donate_ScreenState extends State<Citizen_Donate_Screen> {
  int type = 1;
  bool _isProcessing = false;

  void handle_radio(Object? e) => setState(() {
        type = e as int;
      });

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1300))
        .then((value) => setState(() {
              isLoading = false;
            }));
    print(widget.authority_name);
    print(widget.authority_id);
    print(widget.authority_email);
  }

  final TextEditingController _controllerPay = TextEditingController();
  bool isLoading = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 50,
        backgroundColor: Colors.black12,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
        title: const Text("Donate to Authority here"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                width: size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'Add Amount to donate',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Form(
                                        key: _formKey,
                                        child: TextFormField(
                                          controller: _controllerPay,
                                          keyboardType: TextInputType.number,
                                          maxLength: 7,
                                          decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                                Icons.currency_rupee),
                                            hintText: 'Enter amount',
                                            contentPadding:
                                                const EdgeInsets.all(5.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter amount';
                                            } else if (value.length < 4) {
                                              return 'Minimum amount is 1,000 /-';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text("Choose Payment Method to continue",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600)),
                            // 4 radio
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                width: size.width,
                                child: Column(
                                  children: [
                                    //google pay
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 12),
                                      child: Container(
                                        //margin: EdgeInsets.only(right: 20),
                                        width: size.width,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: type == 1
                                              ? Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xFFDB3022),
                                                )
                                              : Border.all(
                                                  width: 0.4,
                                                  color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Radio(
                                                    value: 1,
                                                    groupValue: type,
                                                    onChanged: handle_radio,
                                                    activeColor:
                                                        const Color(0xFFDB3022),
                                                  ),
                                                  Text('Google Pay',
                                                      style: type == 1
                                                          ? const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black)
                                                          : const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.grey)),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15.0),
                                                child: Image.network(
                                                    'https://1000logos.net/wp-content/uploads/2023/03/Google-Pay-logo.png'),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    //paytm
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 12),
                                      child: Container(
                                        //margin: EdgeInsets.only(right: 20),
                                        width: size.width,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: type == 2
                                              ? Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xFFDB3022),
                                                )
                                              : Border.all(
                                                  width: 0.4,
                                                  color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Radio(
                                                    value: 2,
                                                    groupValue: type,
                                                    onChanged: handle_radio,
                                                    activeColor:
                                                        const Color(0xFFDB3022),
                                                  ),
                                                  Text('Paytm',
                                                      style: type == 2
                                                          ? const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black)
                                                          : const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.grey)),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15.0),
                                                child: Image.network(
                                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Paytm_Logo_%28standalone%29.svg/2560px-Paytm_Logo_%28standalone%29.svg.png',
                                                    height: 20),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    //phone pe
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 12),
                                      child: Container(
                                        //margin: EdgeInsets.only(right: 20),
                                        width: size.width,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: type == 3
                                              ? Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xFFDB3022),
                                                )
                                              : Border.all(
                                                  width: 0.4,
                                                  color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Radio(
                                                    value: 3,
                                                    groupValue: type,
                                                    onChanged: handle_radio,
                                                    activeColor:
                                                        const Color(0xFFDB3022),
                                                  ),
                                                  Text('Phone pe',
                                                      style: type == 3
                                                          ? const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black)
                                                          : const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.grey)),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15.0),
                                                child: Image.network(
                                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/PhonePe_Logo.svg/1280px-PhonePe_Logo.svg.png',
                                                    height: 25),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    //credit card
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 12),
                                      child: Container(
                                        //margin: EdgeInsets.only(right: 20),
                                        width: size.width,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: type == 4
                                              ? Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xFFDB3022),
                                                )
                                              : Border.all(
                                                  width: 0.4,
                                                  color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Radio(
                                                    value: 4,
                                                    groupValue: type,
                                                    onChanged: handle_radio,
                                                    activeColor:
                                                        const Color(0xFFDB3022),
                                                  ),
                                                  Text('Credit card',
                                                      style: type == 4
                                                          ? const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black)
                                                          : const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.grey)),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15.0),
                                                child: Image.network(
                                                    'https://i.pngimg.me/thumb/f/720/comdlpng6953127.jpg',
                                                    height: 25),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Donation amount :',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Text(
                                    _controllerPay.text.isEmpty
                                        ? "₹ 0 /-"
                                        : '₹ ${_controllerPay.text} /-',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 15),
                      width: double.infinity,
                      child: ClipRRect(
                        child: ElevatedButton(
                          onPressed: () async {
                            //showCircularProgressBar(context);
                            // Future.delayed(const Duration(milliseconds: 800))
                            //     .then((value) => Navigator.pop(context));

                            if (_formKey.currentState!.validate()) {
                              if (!_isProcessing) {
                                _processPayment();
                              }
                            }
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          ),
                          child: _isProcessing
                              ? const SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                      color: Colors.green))
                              : const Text('Pay'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void _processPayment() async {
    setState(() {
      _isProcessing = true;
    });

    // Simulating payment processing
    await Future.delayed(const Duration(milliseconds: 2100));

    // After successful payment
    _showSuccessDialog();

    setState(() {
      _isProcessing = false;
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Iconsax.tick_circle4,
                // Icons.circle_notifications_sharp,
                size: 40,
                // width: 80
              ),
              const SizedBox(height: 20),
              const Text(
                'Donation Completed Successfully',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Thank you for your donation!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).pop();
                  Navigator.of(context).pop();

                },
                child: const Text('OK',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

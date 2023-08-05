// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:intl/intl.dart';
// import 'package:suro/constants.dart';

// class CreateAccount extends StatefulWidget {
//   @override
//   State<CreateAccount> createState() => _CreateAccountState();
// }

// class _CreateAccountState extends State<CreateAccount> {
//   final TextEditingController _fname = TextEditingController();
//   final TextEditingController _lname = TextEditingController();
//   final TextEditingController _dobController = TextEditingController();
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _cellphone = TextEditingController();
//   final TextEditingController _langugae = TextEditingController();
//   final TextEditingController _city = TextEditingController();
//   final TextEditingController _confirmPassword = TextEditingController();
//   final TextEditingController _password = TextEditingController();
//   bool isLoading = false;

//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     String selectedGender = '';
//     DateTime? selectedDate;
//     Future<void> _selectDate(BuildContext context) async {
//       final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate ?? DateTime.now(),
//         firstDate: DateTime(1900),
//         lastDate: DateTime.now(),
//       );

//       if (picked != null && picked != selectedDate) {
//         setState(() {
//           selectedDate = picked;
//           _dobController.text = DateFormat('dd-MM-yyyy').format(
//               selectedDate!); // Set the selected date to the date of birth TextField
//         });
//       }
//     }

//     Widget genderRadioOption(String value, String label) {
//       return Row(
//         children: [
//           Radio<String>(
//             value: value,
//             groupValue: selectedGender,
//             onChanged: (value) {
//               setState(() {
//                 selectedGender = value!;
//               });
//             },
//           ),
//           Text(label),
//         ],
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Register Now ',
//           style: TextStyle(
//               color: iconcolor, fontSize: 25 // Set text color to white
//               ),
//         ),
//         // backgroundColor: iconcolor,
//         iconTheme: IconThemeData(
//           color: greys, // Set the back button color to grey
//         ),
//       ),
//       body: isLoading
//           ? Center(
//               child: Container(
//                 height: size.height / 20,
//                 width: size.width / 20,
//                 child: CircularProgressIndicator(),
//               ),
//             )
//           : SingleChildScrollView(
//               child: Column(
//               children: [
//                 // SizedBox(
//                 //   height: size.height / 20,
//                 // ),
//                 Container(
//                   margin: EdgeInsets.symmetric(vertical: 8.0),
//                   padding: EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 4.0,
//                         offset: Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Personal Information",
//                             style: TextStyle(
//                               fontSize: 22.0,
//                               fontWeight: FontWeight.bold,
//                               color: iconcolor,
//                             ),
//                           )
//                         ],
//                       ),
//                       const Padding(padding: EdgeInsets.all(10)),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'First Name',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: greys,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               field(size / 2, "FirstName", Icons.account_box,
//                                   _fname),
//                             ],
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Last Name',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w300,
//                                   color: greys,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               field(size / 2, "LastName", Icons.account_box,
//                                   _lname),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Email Address',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w300,
//                                   color: greys,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               field(size / 2, "Email Address", Icons.email,
//                                   _email),
//                             ],
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Cell Phone',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w300,
//                                   color: greys,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               field(size / 2, "Cell Phone", Icons.phone,
//                                   _cellphone),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Primary Language',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w300,
//                                   color: greys,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               field(size / 2, "Primary Language",
//                                   Icons.language, _langugae),
//                             ],
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'City',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w300,
//                                   color: greys,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               field(
//                                   size / 2, "City", Icons.location_city, _city),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20),
//                       Row(
//                         // mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Column(
//                             children: [
//                               const Text(
//                                 'Date of Birth:',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w300,
//                                   color: greys,
//                                 ),
//                               ),
//                               SizedBox(width: 20),
//                               field(size / 2, "dd-mm-yyyy", Icons.abc,
//                                   _dobController),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Gender:',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w300,
//                                   color: greys,
//                                 ),
//                               ),
//                               SizedBox(width: 20),
//                               genderRadioOption('Heterosexual', 'Heterosexual'),
//                               genderRadioOption('LGBTQIA+', 'LGBTQIA+'),
//                               genderRadioOption('other', 'Other'),
//                             ],
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Sexual orientation',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w300,
//                                   color: greys,
//                                 ),
//                               ),
//                               SizedBox(width: 20),
//                               genderRadioOption('male', 'Male'),
//                               genderRadioOption('female', 'Female'),
//                               genderRadioOption('other', 'Other'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   margin: EdgeInsets.symmetric(vertical: 8.0),
//                   padding: EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 4.0,
//                         offset: Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Your Surrogacy & Egg Donation Requirements",
//                             style: TextStyle(
//                               fontSize: 22.0,
//                               fontWeight: FontWeight.bold,
//                               color: greys,
//                             ),
//                           )
//                         ],
//                       ),
//                       const Padding(padding: EdgeInsets.all(10)),
//                       Row(
//                         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Which services do you think you might need?',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w300,
//                                   color: greys,
//                                 ),
//                               ),
//                               SizedBox(width: 20),
//                               genderRadioOption(
//                                   'Surrogacy & Egg Donor Services',
//                                   'Surrogacy & Egg Donor Services'),
//                               genderRadioOption('Surrogacy Services Only',
//                                   'Surrogacy Services Only'),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20),
//                       Row(
//                         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Timing to Begin',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w300,
//                                   color: greys,
//                                 ),
//                               ),
//                               SizedBox(width: 20),
//                               genderRadioOption(
//                                   'As soon as possible', 'As soon as possible'),
//                               genderRadioOption('Within the next 6 months',
//                                   'Within the next 6 months'),
//                               genderRadioOption('Within the next year',
//                                   'Within the next year'),
//                               genderRadioOption(
//                                   'Not sure, I would like to know more',
//                                   'Not sure, I would like to know more'),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   margin: EdgeInsets.symmetric(vertical: 8.0),
//                   padding: EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 4.0,
//                         offset: Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Create Password",
//                             style: TextStyle(
//                               fontSize: 22.0,
//                               fontWeight: FontWeight.bold,
//                               color: greys,
//                             ),
//                           )
//                         ],
//                       ),
//                       const Padding(padding: EdgeInsets.all(10)),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Password',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w300,
//                                   color: greys,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               field(
//                                   size / 2, "Password", Icons.lock, _password),
//                             ],
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Confirm Password',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w300,
//                                   color: greys,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               field(size / 2, "Confirm Password", Icons.lock,
//                                   _confirmPassword),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   height: size.height / 20,
//                 ),
//                 customButton(size),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Text(
//                       "Sign In",
//                       style: TextStyle(
//                         color: greys,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             )),
//     );
//   }

//   Widget customButton(Size size) {
//     return GestureDetector(
//       child: Container(
//         height: size.height / 14,
//         width: size.width / 1.2,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           color: backgroundC,
//         ),
//         alignment: Alignment.center,
//         child: Text(
//           "Create Account",
//           style: TextStyle(
//             color: iconcolor,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget field(
//       Size size, String hintText, IconData icon, TextEditingController cont) {
//     return Container(
//       height: size.height / 8,
//       width: size.width / 1.1,
//       padding: EdgeInsets.symmetric(horizontal: 15),
//       child: TextField(
//         controller: cont,
//         decoration: InputDecoration(
//           prefixIcon: Icon(
//             icon,
//             color: greys,
//           ),
//           hintText: hintText,
//           hintStyle: TextStyle(
//             color: greys,
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suro/chatInit.dart';
import 'package:suro/constants.dart';
import 'package:suro/customUI/yo.dart';
import 'package:suro/lawsOrders.dart';

class CreateAccount extends StatefulWidget {
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _cellphone = TextEditingController();
  final TextEditingController _langugae = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  bool isChecked = false;

// Inside the form submission handler
  void registerUser() async {
    final url = 'https://surodishibackend-production.up.railway.app/api/user/';
    final userData = {
      'name': _fname.text,
      'email': _email.text,
      'gender': "female",
      'phoneNo': _cellphone.text,
      'city': _city.text,
      'dob': _dobController.text,
      'country': _langugae.text,
      'password':_password.text,
      'sexualOrientation': _confirmPassword.text,
    };

    setState(() {
      isLoading = true;
    });

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    setState(() {
      isLoading = false;
    });

    // Handle the response from the API
    if (response.statusCode == 201) {
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      // Registration successful, show a success message or navigate to login screen
      print("Suceessful");
    } else {
      // Registration failed, show an error message or handle the specific error
      print("Errro");
    }
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String selectedGender = '';

    // Future<void> _selectDate(BuildContext context) async {
    //   final DateTime? picked = await showDatePicker(
    //     context: context,
    //     initialDate: selectedDate ?? DateTime.now(),
    //     firstDate: DateTime(1900),
    //     lastDate: DateTime.now(),
    //   );

    //   if (picked != null && picked != selectedDate) {
    //     setState(() {
    //       selectedDate = picked;
    //       _dobController.text =
    //           ""; // Set the selected date to the date of birth TextField
    //     });
    //   }
    // }

    Widget genderRadioOption(String value, String label) {
      return Row(
        children: [
          Radio<String>(
            value: value,
            groupValue: selectedGender,
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
            },
          ),
          Text(label),
        ],
      );
    }

    Widget customButton(Size size) {
      return ElevatedButton(
        onPressed: (){
          registerUser();
        },
        child: Container(
          height: size.height / 14,
          width: size.width / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: iconcolor,
          ),
          alignment: Alignment.center,
          child: Text(
            "Create Account",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    Widget field(
        Size size, String hintText, IconData icon, TextEditingController cont) {
      return Container(
        height: size.height / 8,
        width: size.width / 1.1,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          controller: cont,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: greys,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: greys,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Signing Up ',
          style: TextStyle(
              color: iconcolor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: greys,
        ),
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.width / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Personal Information",
                          style: TextStyle(
                            fontSize: 22.0,
                            // fontWeight: FontWeight.bold,
                            color: iconcolor,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: Text(
                                      'First Name: ',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: greys,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  field(size / 1.5, "First Name",
                                      Icons.account_box, _fname),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: Text(
                                      'Last Name: ',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: greys,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  field(size / 1.5, "Last Name",
                                      Icons.account_box, _lname),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: Text(
                                      'Email Id: ',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: greys,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  field(size / 1.5, "Email id",
                                      Icons.account_box, _email),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: Text(
                                      'Address: ',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: greys,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  field(size / 1.5, "city", Icons.location_city,
                                      _city),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: Text(
                                      'Phone Number: ',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: greys,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  field(size / 1.5, "phone number", Icons.call,
                                      _cellphone),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: Text(
                                      'Primary Language: ',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: greys,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  field(size / 1.5, "primary language",
                                      Icons.language, _langugae),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: Text(
                                      'Date Of Birth: ',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: greys,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  field(size / 1.5, "dd-mm-yyyy",
                                      Icons.calendar_month, _lname),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(height: 20),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Expanded(
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Text(
                        //             'Primary Language',
                        //             style: TextStyle(
                        //               fontSize: 18.0,
                        //               fontWeight: FontWeight.w300,
                        //               color: greys,
                        //             ),
                        //           ),
                        //           SizedBox(height: 5),
                        //           field(size / 2, "Primary Language",
                        //               Icons.language, _langugae),
                        //         ],
                        //       ),
                        //     ),
                        //     Expanded(
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Text(
                        //             'City',
                        //             style: TextStyle(
                        //               fontSize: 18.0,
                        //               fontWeight: FontWeight.w300,
                        //               color: greys,
                        //             ),
                        //           ),
                        //           SizedBox(height: 5),
                        //           field(size / 2, "City", Icons.location_city,
                        //               _city),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 20),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Expanded(
                        //       child: Column(
                        //         children: [
                        //           Text(
                        //             'Date of Birth:',
                        //             style: TextStyle(
                        //               fontSize: 18.0,
                        //               fontWeight: FontWeight.w300,
                        //               color: greys,
                        //             ),
                        //           ),
                        //           SizedBox(width: 20),
                        //           GestureDetector(
                        //             onTap: () => _selectDate(context),
                        //             child: AbsorbPointer(
                        //               child: field(size / 2, "dd-mm-yyyy",
                        //                   Icons.abc, _dobController),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gender:',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: greys,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  genderRadioOption(
                                      'Heterosexual', 'Heterosexual'),
                                  genderRadioOption('LGBTQIA+', 'LGBTQIA+'),
                                  genderRadioOption('other', 'Other'),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sexual orientation',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: greys,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  genderRadioOption('male', 'Male'),
                                  genderRadioOption('female', 'Female'),
                                  genderRadioOption('other', 'Other'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Surrogacy & Egg Donation Requirements",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: iconcolor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Which services do you think you might need?',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: greys,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  genderRadioOption(
                                    'Surrogacy & Egg Donor Services',
                                    'Surrogacy & Egg Donor Services',
                                  ),
                                  genderRadioOption(
                                    'Surrogacy Services Only',
                                    'Surrogacy Services Only',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Timing to Begin',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: greys,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  genderRadioOption(
                                    'As soon as possible',
                                    'As soon as possible',
                                  ),
                                  genderRadioOption(
                                    'Within the next 6 months',
                                    'Within the next 6 months',
                                  ),
                                  genderRadioOption(
                                    'Within the next year',
                                    'Within the next year',
                                  ),
                                  genderRadioOption(
                                    'Not sure, I would like to know more',
                                    'Not sure, I would like to know more',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create Password",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: iconcolor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: Text(
                                      'Password: ',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: greys,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  field(size / 1.5, "password", Icons.lock,
                                      _password),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: Text(
                                      'Confirm Password: ',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: greys,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  field(size / 1.5, "confirm password",
                                      Icons.lock, _confirmPassword),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  // SizedBox(height: size.height / 20),
                  Center(
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isChecked = newValue ?? false;
                            });
                          },
                        ),
                        Row(
                          children: [
                            Text(
                              "By siging up you accept the ",
                              style: TextStyle(
                                color: greys,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigate to the next page when the link is tapped.
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TermsConditionsPage()));
                              },
                              child: Text(
                                "Laws and Orders ",
                                style: TextStyle(
                                  color: iconcolor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  customButton(size),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        "Already have an account? Sign In",
                        style: TextStyle(
                          color: greys,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}

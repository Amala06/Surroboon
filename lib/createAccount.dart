import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:suro/constants.dart';

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

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String selectedGender = '';
    DateTime? selectedDate;
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          _dobController.text = DateFormat('dd-MM-yyyy').format(
              selectedDate!); // Set the selected date to the date of birth TextField
        });
      }
    }

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

    return Scaffold(
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
                SizedBox(
                  height: size.height / 20,
                ),
                Container(
                  width: size.width / 1.1,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: iconcolor,
                          size: 25,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Expanded(
                        child: Text(
                          "Empowering Parenthood: Register Now for Surrogate Finding Services!",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: heading,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Row(
                  // width: size.width / 1.1,
                  children: [
                    // Padding(padding: EdgeInsets.all(35)),
                    //  padding: EdgeInsets.all(16.0),
                    Text(
                      "Register here",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height / 20,
                ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Basic Information",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: heading,
                            ),
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'First Name',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w200,
                                  color: heading,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              field(size / 2, "FirstName", Icons.account_box,
                                  _fname),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Last Name',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w200,
                                  color: heading,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              field(size / 2, "LastName", Icons.account_box,
                                  _lname),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Email Address',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w200,
                                  color: heading,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              field(size / 2, "Email Address", Icons.email,
                                  _email),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Cell Phone',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w200,
                                  color: heading,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              field(size / 2, "Cell Phone", Icons.phone,
                                  _cellphone),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Primary Language',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w200,
                                  color: heading,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              field(size / 2, "Primary Language",
                                  Icons.language, _langugae),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'City',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w200,
                                  color: heading,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              field(
                                  size / 2, "City", Icons.location_city, _city),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Date of Birth:',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w200,
                                  color: heading,
                                ),
                              ),
                              SizedBox(width: 20),
                              field(size / 2, "dd-mm-yyyy", Icons.abc,
                                  _dobController),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gender:',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w200,
                                  color: heading,
                                ),
                              ),
                              SizedBox(width: 20),
                              genderRadioOption('Heterosexual', 'Heterosexual'),
                              genderRadioOption('LGBTQIA+', 'LGBTQIA+'),
                              genderRadioOption('other', 'Other'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sexual orientation',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w200,
                                  color: heading,
                                ),
                              ),
                              SizedBox(width: 20),
                              genderRadioOption('male', 'Male'),
                              genderRadioOption('female', 'Female'),
                              genderRadioOption('other', 'Other'),
                            ],
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Surrogacy & Egg Donation Requirements",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: heading,
                            ),
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Which services do you think you might need?',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w200,
                                  color: heading,
                                ),
                              ),
                              SizedBox(width: 20),
                              genderRadioOption(
                                  'Surrogacy & Egg Donor Services',
                                  'Surrogacy & Egg Donor Services'),
                              genderRadioOption('Surrogacy Services Only',
                                  'Surrogacy Services Only'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Timing to Begin',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w200,
                                  color: heading,
                                ),
                              ),
                              SizedBox(width: 20),
                              genderRadioOption(
                                  'As soon as possible', 'As soon as possible'),
                              genderRadioOption('Within the next 6 months',
                                  'Within the next 6 months'),
                              genderRadioOption('Within the next year',
                                  'Within the next year'),
                              genderRadioOption(
                                  'Not sure, I would like to know more',
                                  'Not sure, I would like to know more'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create Password",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: heading,
                            ),
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w200,
                                  color: heading,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              field(
                                  size / 2, "Password", Icons.lock, _password),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Confirm Password',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w200,
                                  color: heading,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              field(size / 2, "Confirm Password", Icons.lock,
                                  _confirmPassword),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                customButton(size),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: heading,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            )),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      child: Container(
        height: size.height / 14,
        width: size.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: backgroundC,
        ),
        alignment: Alignment.center,
        child: Text(
          "Create Account",
          style: TextStyle(
            color: iconcolor,
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
            color: iconcolor,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: backgroundC,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

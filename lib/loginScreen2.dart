import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suro/appstate.dart';
import 'package:suro/constants.dart';
import 'package:suro/createAccount.dart';
import 'package:http/http.dart' as http;
import 'package:suro/createAccountSurro.dart';
import 'dart:convert';

import 'package:suro/customUI/yo.dart';
import 'package:suro/welcomesurro.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  // late final isLoggedIn;

  void login() async {
    print(_email.text);
    print(_password.text);

    final url =
        'https://surodishibackend-production.up.railway.app/api/user/login';

    final userData = {
      'email': _email.text,
      'password': _password.text,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    // Handle the response from the API
    if (response.statusCode == 200) {
      // Login successful, navigate to the home screen or perform any other actions
      print("Successful");

      // Parse the response JSON to get the userID
      final jsonResponse = json.decode(response.body);
      final userID = jsonResponse['_id'];
      final userName = jsonResponse['name'];
      final userPic = jsonResponse['pic'];
      print(userID);

      // Set the userID in the AppState
      final appState = Provider.of<AppState>(context, listen: false);
      appState.userID = userID;
      appState.userName = userName;
      appState.userPic = userPic;

      print("appState.UserID : " + appState.userID);
      print("appState.UserName : " + appState.userName);

      print("appState.UserPic : " + appState.userPic);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      // isLoggedIn = true;
      // final appState = Provider.of<AppState>(context, listen: false);
      appState.isLoggedIn = true;
    } else {
      print("Error");
    }
  }

  bool isLoading = false;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // isLoggedIn = Provider.of<AppState>(context).isLoggedIn;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hello, Surrogate!',
            style: TextStyle(
                color: iconcolor,
                fontSize: 25,
                fontWeight: FontWeight.bold // Set text color to white
                ),
          ),
          // backgroundColor: iconcolor,
          iconTheme: IconThemeData(
            color: greys, // Set the back button color to grey
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
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/user.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width / 1.2,
                    alignment: Alignment.center,
                    child: field(size, "email", Icons.account_box, _email),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Container(
                      width: size.width / 1.2,
                      alignment: Alignment.center,
                      child: field(size, "password", Icons.lock, _password),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
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
                        Text(
                          "Remember me",
                          style: TextStyle(color: greys),
                        ),
                      ],
                    ),
                  ),
                  customButton(size),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => CreateAccountSurro())),
                    child: Text(
                      "Don't have any account? Sign Up",
                      style: TextStyle(
                        color: greys,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              )));
  }

  Widget customButton(Size size) {
    return ElevatedButton(
      onPressed: () {
        login();
      },
      style: ElevatedButton.styleFrom(
        // backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 5),
      ),
      // onTap: () {
      //   if(_email.text.isNotEmpty && _password.text.isNotEmpty)
      //   {
      //     setState(() {
      //       isLoading=true;
      //     });
      //     logIn(_email.text, _password.text).then((user){
      //       if(user!=null)
      //       {
      //         print("Login Successfully");
      //         setState(() {
      //           isLoading=false;
      //         });
      //       }
      //       else
      //       {
      //         print("Login Failed");
      //         setState(() {
      //           isLoading=false;
      //         });
      //       }
      //     });
      //   }
      //   else{
      //     print("Please enter fields");
      //   }
      //},
      child: Container(
        height: size.height / 14,
        width: size.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),
          color: iconcolor,
        ),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            // Navigate to the next page when the link is tapped.
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WelcomePage()));
          },
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget field(
      Size size, String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.1,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: greys,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: greys),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27),
          ),
        ),
      ),
    );
  }
}

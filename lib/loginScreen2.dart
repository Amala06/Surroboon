import 'package:flutter/material.dart';
import 'package:suro/chatInit.dart';
import 'package:suro/chathome.dart';
import 'package:suro/createAccount.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:suro/appstate.dart';
import 'dart:convert';
// import 'package:suro/customUI/loginscreen.dart';
import 'package:suro/profile.dart';

import 'package:suro/splash.dart';
import 'package:suro/customUI/yo.dart';

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // isLoggedIn = Provider.of<AppState>(context).isLoggedIn;

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
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          "Welcome",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: size.height / 20,
                  // ),
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //   width: size.width / 1.2,
                  //     child: IconButton(onPressed: (){},
                  //         icon: Icon(Icons.arrow_back_ios))
                  //         ),
                  //         SizedBox(
                  //           height: size.height / 50,
                  //         ),
                  // Container(
                  //   width: size.width / 1.3,

                  //   child: Text(
                  //     "Welcome",
                  //     style: TextStyle(
                  //       fontSize: 34,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   width: size.width / 1.3,
                  //   child: Text(
                  //     "Sign In to Continue!",
                  //     style: TextStyle(
                  //       color: Colors.grey[700],
                  //       fontSize: 25,
                  //       fontWeight: FontWeight.w500,
                  //     ),
                  //   ),
                  // ),

                  SizedBox(
                    height: size.height / 10,
                  ),
                  Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: field(size, "email", Icons.account_box, _email),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: field(size, "password", Icons.lock, _password),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 10,
                  ),
                  customButton(size),

                  SizedBox(
                    height: size.height / 40,
                  ),

                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => CreateAccount())),
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              )));
  }

  Widget customButton(Size size) {
    return GestureDetector(
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
      child: ElevatedButton(
        onPressed: () {
          login();
        },
        child: Container(
          height: size.height / 14,
          width: size.width / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromARGB(255, 243, 33, 198),
          ),
          alignment: Alignment.center,
          child: Text(
            "Login",
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
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

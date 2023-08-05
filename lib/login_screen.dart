import 'package:flutter/material.dart';
import 'package:suro/constants.dart';
import 'package:suro/createAccount.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hello, Parent!',
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
                          image: NetworkImage('assets/images/user.jpeg'),
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
                          "Remeber me.",
                          style: TextStyle(color: greys),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  customButton(size),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => CreateAccount())),
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
      child: Container(
        height: size.height / 14,
        width: size.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),
          color: iconcolor,
        ),
        alignment: Alignment.center,
        child: Text(
          "Sign In",
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

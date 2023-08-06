import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suro/appstate.dart';
import 'package:suro/chatInit.dart';
import 'package:suro/chathome.dart';
import 'package:suro/login_screen.dart';
import 'package:suro/constants.dart';
import 'package:suro/list.dart';
import 'package:suro/splash.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Profile extends StatelessWidget {
  final String pizzaName;
  final String pizzaBest;
  final String targetid;
  final String targetname;
  final String targetpic;
  final String age;
  final String country;
  final String weight;
  final String height;
  final String useOfAlchohol;
  final String preg;
  final String anyIll; //more things will be added here
  final String periodHistory;
  final String martial;
  final String city;
// AppState
  Profile({
    required this.pizzaName,
    required this.pizzaBest,
    required this.targetid,
    required this.targetname,
    required this.targetpic,
    required this.age,
    required this.country,
    required this.weight,
    required this.height,
    required this.useOfAlchohol,
    required this.preg,
    required this.anyIll,
    required this.periodHistory,
    required this.martial,
    required this.city,
  });

  // final String pizzapic;

  List imgs = [""];

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = Provider.of<AppState>(context).isLoggedIn;

    // Set the userID in the AppState
    final appState = Provider.of<AppState>(context, listen: false);
    appState.targetID = targetid;
    appState.targetName = targetname;

    appState.targetPic = targetpic;

    print("appState.targetID : " + appState.targetID);
    print("appState.targetName : " + appState.targetName);
    print("appState.targetPic : " + appState.targetPic);

    void chatlistformation() async {
      final url =
          'https://surodishibackend-production.up.railway.app/api/user/chatlist';

      final userData = {
        '_id': appState.userID,
        'username': appState.userName,
        'userpic': appState.userPic,
        'targetid': appState.targetID,
        'name': appState.targetName,
        'pic': appState.targetPic,
      };

      // setState(() {
      //   // isLoading = true;
      // });

      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );

      // setState(() {
      //   isLoading = false;
      // });

      // Handle the response from the API
      if (response.statusCode == 200) {
        // Registration successful, show a success message or navigate to login screen
        print("Suceessful chat list");
      } else {
        // Registration failed, show an error message or handle the specific error
        print("Errro in chat list");
      }
    }

    void fun() {
      final isLoggedIn =
          Provider.of<AppState>(context, listen: false).isLoggedIn;

      if (isLoggedIn) {
        chatlistformation();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ChatInit()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false,
        );
      }
    }

    return Scaffold(
      // backgroundColor: ,

      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              // Container to create the oval shape with a background color and border radius
              Container(
                width: double.infinity,
                height: 200, // Adjust the height as needed
                decoration: BoxDecoration(
                  color:
                      iconcolor2, // Replace with your desired background color
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        200, 100), // Adjust the radii to create an oval shape
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  // Adjust the bottom padding as needed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        '$pizzaName',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '$pizzaBest',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 30),
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(targetpic),
                      ),
                      // SizedBox(height: 15),
                      // SizedBox(height: 5),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [],
                      // ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: greys,
                        size: 25,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.more_vert,
                        color: greys,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // SizedBox(height: 10),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                // Padding(padding: EdgeInsets.symmetric(horizontal: 10)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Weight/Height",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Period History",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Martial status",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      weight + '/' + height,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      periodHistory,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      martial,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: 300, // Adjust the width as needed
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      " Pregnancy Ex.",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Any Illness",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Alochol Cons.",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      preg,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      anyIll,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      useOfAlchohol,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: 300, // Adjust the width as needed
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Icon(
                    //   CupertinoIcons.chat_bubble_text_fill,
                    //   color: Colors.purple,
                    //   size: 10,
                    // ),
                    Text(
                      "Nearest city",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Born Country",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      " Age",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      city,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      country,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      age,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 75),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        fun();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        // disabledBackgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.2, vertical: 0.3),
                        // shape: CircleBorder(),
                        // Add any other custom styles for the button
                      ),
                      child: Icon(
                        CupertinoIcons.chat_bubble_text_fill,
                        color: iconcolor,
                        size: 60,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

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
 final  String weight;
 final  String height;
  final String useOfAlchohol;
 final  String preg;
  final String anyIll; //more things will be added here
  final String periodHistory;
  final String martial;
  final String city;
// AppState
  Profile({required this.pizzaName, required this.pizzaBest,required this.targetid,required this.targetname,required this.targetpic,
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

void chatlistformation () async {
        final url =
            'https://surodishibackend-production.up.railway.app/api/user/chatlist';
        

        
        final userData = {
          '_id':appState.userID,
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
      backgroundColor: backgroundC,
      body: SingleChildScrollView(
          // child: Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     Container(
          //       width: double.infinity,
          //       height: 150,
          //       color: Colors.grey,
          //       child: Center(
          //         child: CircleAvatar(
          //           radius: 60,
          //           backgroundImage: AssetImage("assets/images/c1.jpg"),
          //         ),
          //       ),
          //     ),

          //     // Rest of your profile information widgets...
          //   ],
          // ),

          child: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.more_vert,
                        color: iconcolor,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(targetpic),
                      ),
                      SizedBox(height: 15),
                      Text(
                        '$pizzaName',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: heading,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '$pizzaBest',
                        style: TextStyle(
                          color: heading,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [],
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //       padding: EdgeInsets.all(10),
                      //       decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         shape: BoxShape.circle,
                      //       ),
                      //       child: Icon(Icons.call,
                      //       color: Colors.black,
                      //       size: 25,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 25),
          Container(
            height: MediaQuery.of(context).size.height / 1,
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 10,
              left: 15,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Information",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          CupertinoIcons.eye_fill,
                          color: Colors.purple,
                          size: 10,
                        ),
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
                      weight+'/'+height,
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
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(
                      color: Colors.black,
                      thickness: 1.0,
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
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(
                      color: Colors.black,
                      thickness: 1.0,
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
                    Icon(
                      CupertinoIcons.heart_circle_fill,
                      color: Colors.purple,
                      size: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        fun();
                      },
                      child: Icon(
                        CupertinoIcons.chat_bubble_text_fill,
                        color: Colors.purple,
                        size: 40,
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

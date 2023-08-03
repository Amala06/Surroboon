import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suro/list.dart';

class Profile extends StatelessWidget {
  final String pizzaName;
  final bool pizzaBest;

  Profile({required this.pizzaName, required this.pizzaBest});
  List imgs = [""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SingleChildScrollView(
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
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.more_vert,
                        color: Colors.black,
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
                        radius: 35,
                        backgroundImage: AssetImage("sp.png"),
                      ),
                      SizedBox(height: 15),
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
            height: MediaQuery.of(context).size.height / 1.5,
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 20,
              left: 15,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: const Column(
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
                          "Eye color",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Hair color",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Children",
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
                      "Green",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Black",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "0",
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
                      "Eye color",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Hair color",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Children",
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
                      "Green",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Black",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "0",
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
                      "Eye color",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Hair color",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Children",
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
                      "Green",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Black",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "0",
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
                    Icon(
                      CupertinoIcons.chat_bubble_text_fill,
                      color: Colors.purple,
                      size: 40,
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

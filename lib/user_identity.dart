import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suro/constants.dart';
import 'package:suro/loginScreen2.dart';
import 'package:suro/login_screen.dart';

class user_identity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Identity',
          style: TextStyle(
            color: iconcolor,
            // fontSize: 25,
            // fontWeight: FontWeight.bold // Set text color to white
          ),
        ),
        // backgroundColor: iconcolor,
        iconTheme: IconThemeData(
          color: greys, // Set the back button color to grey
        ),
      ),
      // backgroundColor: Colors.pink,

      body: SingleChildScrollView(
          child: Column(
        children: [
          // SizedBox(height: 50),

          // SizedBox(height: 25),
          // Center(
          //   child: Container(
          //     width: double.infinity,
          //     height: 200,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: NetworkImage('assets/images/splash.jpg'),
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(height: 20),
          // Stack(
          //   children: [
          //     // Padding(padding: EdgeInsets.all(5)),
          //     Row(
          //       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Padding(padding: EdgeInsets.all(5)),
          //         InkWell(
          //           onTap: () {
          //             Navigator.pop(context);
          //           },
          //           child: const Icon(
          //             Icons.arrow_back_ios_new,
          //             color: greys,
          //             size: 25,
          //           ),
          //         ),
          //         Padding(padding: EdgeInsets.symmetric(horizontal: 6)),
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Center(
          //               child: Text(
          //                 "User Identity",
          //                 style: TextStyle(
          //                   fontSize: 22.0,
          //                   fontWeight: FontWeight.bold,
          //                   color: iconcolor,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          Center(
            child: Container(
              width: double.infinity,
              height: 600,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('assets/images/ps5.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(vertical: 8.0),
          //   padding: EdgeInsets.all(16.0),
          //   decoration: BoxDecoration(
          //     color: iconcolor,
          //     borderRadius: BorderRadius.circular(8.0),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black12,
          //         blurRadius: 4.0,
          //         offset: Offset(0, 2),
          //       ),
          //     ],
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       // Padding(
          //       // padding: EdgeInsets.all(10),
          //       Container(
          //         width: 150,
          //         height: 30,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             GestureDetector(
          //               onTap: () {
          //                 // Navigate to the next page when the link is tapped.
          //                 Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) => LoginScreen()));
          //               },
          //               child: Text(
          //                 "Parent",
          //                 style: TextStyle(
          //                   fontSize: 20.0,
          //                   fontWeight: FontWeight.bold,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // Container(
          //   margin: EdgeInsets.symmetric(vertical: 8.0),
          //   padding: EdgeInsets.all(16.0),
          //   decoration: BoxDecoration(
          //     color: iconcolor,
          //     borderRadius: BorderRadius.circular(8.0),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black12,
          //         blurRadius: 4.0,
          //         offset: Offset(0, 2),
          //       ),
          //     ],
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Container(
          //         width: 150,
          //         height: 30,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             GestureDetector(
          //               onTap: () {
          //                 // Navigate to the next page when the link is tapped.
          //                 Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) => LoginScreen2()));
          //               },
          //               child: Text(
          //                 "Surrogate",
          //                 style: TextStyle(
          //                   fontSize: 20.0,
          //                   fontWeight: FontWeight.bold,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // gpt
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: iconcolor,
                  borderRadius: BorderRadius.circular(27),
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
                    Container(
                      width: 150,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigate to the next page when the link is tapped.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Parent",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: iconcolor, // Set the border color to purple
                    width: 2.0,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(27),
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
                    Container(
                      width: 150,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigate to the next page when the link is tapped.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen2(),
                                ),
                              );
                            },
                            child: Text(
                              "Surrogate",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: iconcolor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

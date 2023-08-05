import 'package:flutter/material.dart';
import 'package:suro/constants.dart';
import 'package:suro/main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(title: 'SURROBOON')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // child: Text("Splash Screen"),
        child: Image.asset(
          "assets/images/sp.png",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity, // Set the desired width
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
      // body: Stack(
      //   children: [
      //     // Background image
      //     Image.asset(
      //       "assets/images/splash.jpg",
      //       fit: BoxFit.cover,
      //       height: double.infinity,
      //       width: double.infinity,
      //     ),

      //     // Grey overlay on top of the image
      //     Container(
      //       color: iconcolor.withOpacity(0.5),
      //       height: double.infinity,
      //       width: double.infinity,
      //     ),

      //     // Centered text on the image
      //     Center(
      //       child: Container(
      //         padding: EdgeInsets.all(16.0),
      //         decoration: BoxDecoration(
      //           // color: Colors.grey.withOpacity(0.7),
      //           borderRadius: BorderRadius.circular(8.0),
      //         ),
      //         child: const Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text(
      //               "SURROBOON",
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 40,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //             Text(
      //               "tagline",
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 25,
      //                 // fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
  //   );
  // }
}

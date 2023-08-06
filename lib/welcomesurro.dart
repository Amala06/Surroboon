import 'package:flutter/material.dart';
import 'package:suro/constants.dart';
import 'package:suro/createAccountSurro.dart';
import 'package:suro/customUI/yo.dart';
import 'package:suro/main.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/splash.jpg', // Replace with your image path
                  fit: BoxFit.cover,
                  height: 500,
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                'Hello, Surrogate!',
                style: TextStyle(
                    color: iconcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(height: 6.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  'Bridging Hearts, Building Families. Our app creates a nurturing space where parents and surrogates can forge strong bonds, share experiences, and journey together towards the beautiful gift of parenthood.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: greys),
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: iconcolor, // Set the background color here
                  // You can also customize other properties like padding, shape, etc.
                ),
                onPressed: () {
                  // Add your navigation logic here
                  // For example, you can navigate to the next page using:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen()),
                  );
                  // );
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      backgroundColor: iconcolor, color: Colors.white),
                ),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}

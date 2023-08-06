import 'package:flutter/material.dart';
import 'package:suro/HomeM.dart';
import 'package:suro/constants.dart';

class SplashScreenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AppIntermediateScreen(
          title: "Welcome to the ChatBot",
          description:
              "We are delighted to introduce our advanced chatbot designed specifically to facilitate smooth and effective communication between surrogates and intended parents. As you embark on this incredible journey together, we understand that clear and open communication is crucial in creating a strong and supportive partnership.",
          descriptionColor: greys, // Set the description color here
          buttonText: "Continue",
          onPressed: () {
            // Add navigation to the next page (Chatbot or Home page)
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ),
    );
  }
}

class AppIntermediateScreen extends StatelessWidget {
  final String title;
  final String description;
  final Color descriptionColor;
  final String buttonText;
  final VoidCallback onPressed;

  AppIntermediateScreen({
    required this.title,
    required this.description,
    required this.descriptionColor,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;

        double titleFontSize = maxWidth < 600 ? 24 : 32;
        double descriptionFontSize = maxWidth < 600 ? 14 : 16;
        double buttonPaddingHorizontal = maxWidth < 600 ? 20 : 30;
        double buttonPaddingVertical = maxWidth < 600 ? 10 : 15;

        return Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: iconcolor.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add the Image widget here
              Image.asset(
                'images/chat1.jpg', // Replace with your image path
                width: 120, // Adjust the width as needed
                height: 120, // Adjust the height as needed
              ),
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: iconcolor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: descriptionFontSize,
                  color: descriptionColor, // Use the provided descriptionColor
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: onPressed,
                child: Text(
                  buttonText,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: iconcolor,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ChatbotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbot"),
      ),
      body: Center(
        child: Text("Chatbot page"),
      ),
    );
  }
}

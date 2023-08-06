import 'package:flutter/material.dart';
import 'package:suro/main.dart';

class Bond extends StatefulWidget {
  const Bond({Key? key});

  @override
  State<Bond> createState() => _BondState();
}

class _BondState extends State<Bond> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 5000));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: 'Surroboon')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/bd.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

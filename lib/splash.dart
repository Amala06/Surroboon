import 'package:flutter/material.dart';
import 'package:suro/main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetoHome();
  }

  _navigatetoHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(title: 'Surroboon')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Splash Screen"),
        // child: Image.asset("assets/sp.png"),
      ),
    );
  }
}

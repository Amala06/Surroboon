import 'package:flutter/material.dart';
import 'package:suro/chathome.dart';
import 'package:suro/chatmodel.dart';
import 'package:suro/customUI/buttoncard.dart';
import 'package:provider/provider.dart';
import 'package:suro/appstate.dart';
class LoginScreen extends StatefulWidget {
const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  // late Chatmodel sourcechat;
  // List<Chatmodel> chatmodels = [
  //   Chatmodel(
  //       name: "Diana Mathew",
  //       time: "13:00",
  //       icon: "",
  //       currentMessage: "Hello all",
  //       id: 1),
  //   Chatmodel(
  //       name: "Hellan Mathew",
  //       time: "13:00",
  //       icon: "",
  //       currentMessage: " all",
  //       id: 2),
  //   Chatmodel(
  //       name: "Ruksana Mohmd",
  //       time: "13:00",
  //       icon: "",
  //       currentMessage: "Hello all",
  //       id: 3),
  //   Chatmodel(
  //       name: "Ruksana Mohmd",
  //       time: "13:00",
  //       icon: "",
  //       currentMessage: "Hello all",
  //       id: 4),
  // ];

  @override
  Widget build(BuildContext context) {
      final appState = Provider.of<AppState>(context, listen: false);
    late Chatmodel sourcechat;
    List<Chatmodel> chatmodels = [
      Chatmodel(
          name: appState.userName,
          time: "13:00",
          icon: appState.userPic,
          currentMessage: "Hello all",
          id: appState.userID),
           Chatmodel(
          name: appState.targetName,
          time: "13:00",
          icon: appState.targetPic,
          currentMessage: " all",
          id: appState.targetID),
      Chatmodel(
          name: "Hellan Mathew",
          time: "13:00",
          icon: "",
          currentMessage: " all",
          id: "2"),
      Chatmodel(
          name: "Ruksana Mohmd",
          time: "13:00",
          icon: "",
          currentMessage: "Hello all",
          id: "3"),
      Chatmodel(
          name: "Ruksana Mohmd",
          time: "13:00",
          icon: "",
          currentMessage: "Hello all",
          id: "4"),
    ];

    return Scaffold(
      body: ListView.builder(
          itemCount: chatmodels.length,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                sourcechat = chatmodels.removeAt(index);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => ChatHome(
                             chatmodels: chatmodels, sourcechat: sourcechat)));
              },
              child: ButtonCard(
                  name: chatmodels[index].name,))),
    );
  }
}

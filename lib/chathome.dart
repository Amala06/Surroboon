import 'package:flutter/material.dart';
import 'package:suro/chatmodel.dart';
import 'package:suro/constants.dart';
import 'package:suro/customUI/custom_ui.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({Key? key, required this.chatmodels, required this.sourcechat})
      : super(key: key);
  final List<Chatmodel> chatmodels;
  final Chatmodel sourcechat;

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  // List<Chatmodel> chats = [
  //   Chatmodel(
  //     name: "Diana Francis",
  //     time: "13:00",
  //     icon: "",
  //     currentMessage: "Hello all",
  //   ),
  //   Chatmodel(
  //     name: "Hellan Mathew",
  //     time: "13:00",
  //     icon: "",
  //     currentMessage: " all",
  //   ),
  //   Chatmodel(
  //     name: "Ruksana Mohmd",
  //     time: "13:00",
  //     icon: "",
  //     currentMessage: "Hello all",
  //   ),
  //     Chatmodel(
  //     name: "Ruksana Mohmd",
  //     time: "13:00",
  //     icon: "",
  //     currentMessage: "Hello all",
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Surroboon chat",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: iconcolor,
          actions: [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.search, color: Colors.white),
            ),
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(child: Text("Translate"), value: "Translate"),
                  PopupMenuItem(child: Text("Setting"), value: "Setting"),
                ];
              },
              onSelected: (String value) {
                // Handle the selection of menu items here
                print("Selected: $value");
              },
              icon: Icon(Icons.more_vert, color: Colors.white),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: iconcolor, // Set background color to pink
          foregroundColor: Colors.white, // Set icon color to white
          child: Icon(Icons.chat),
        ),
        body: ListView.builder(
          itemCount: widget.chatmodels?.length,
          itemBuilder: (context, index) => CustomCard(
            chatmodel: widget.chatmodels?[index],
            sourcechat: widget.sourcechat,
          ),
        ));
  }
}

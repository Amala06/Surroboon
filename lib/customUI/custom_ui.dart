import 'package:flutter/material.dart';
import 'package:suro/chatmodel.dart';
import 'package:suro/customUI/individual_chat.dart';

class CustomCard extends StatelessWidget {
  
  const CustomCard({Key? key, this.chatmodel, required this.sourcechat})
      : super(key: key);
  final Chatmodel? chatmodel;
  final Chatmodel sourcechat; // Add '?' to make it nullable
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualChat(
                      chatmodel: chatmodel,
                      sourcechat: sourcechat,
                    )));
      },
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 30,
              backgroundColor: Color.fromARGB(255, 245, 209, 221),
              child: Icon(Icons.person),
            ),
            title: Text(chatmodel?.name ?? "Name Not Available",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(chatmodel?.currentMessage ?? "Message Not Available",
                style: const TextStyle(fontSize: 13)),
            trailing: Text(chatmodel?.time ?? "Time Not Available"),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(thickness: 1),
          ),
        ],
      ),
    );
  }
}

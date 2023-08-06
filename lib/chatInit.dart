import 'package:flutter/material.dart';
// import 'package:suro/customUI/loginscreen.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:suro/appstate.dart';
// import 'package:suro/customUI/beforeyo.dart';
import 'dart:convert';

import 'package:suro/customUI/yo.dart';
// class ChatInit extends StatefulWidget {
//   const ChatInit({super.key});

//   @override
//   State<ChatInit> createState() => _ChatInitState();
// }

// class _ChatInitState extends State<ChatInit> {
//   @override
//   @override
//   void initState() {
//     super.initState();
//     // chatlistformation();

//     // _navigatetoChat();
//   }
      
//   // _navigatetoChat() async {
//   //   await Future.delayed(Duration(milliseconds: 1500), () {});
//   //   Navigator.pushReplacement(
//   //       context, MaterialPageRoute(builder: (context) => LoginScreen()));
//   // }
 

//   @override
//   Widget build(BuildContext context) {
//     final appState = Provider.of<AppState>(context, listen: false);

//     void chatlistformation() async {
//       final url =
//           'https://surodishibackend-production.up.railway.app/api/user/chatlist';

//       final userData = {
//         '_id': appState.userID,
//         'username': appState.userName,
//         'userpic': appState.userPic,
//         'targetid': appState.targetID,
//         'name': appState.targetName,
//         'pic': appState.targetPic,
//       };

//       // setState(() {
//       //   // isLoading = true;
//       // });

//       final response = await http.post(
//         Uri.parse(url),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(userData),
//       );

//       // setState(() {
//       //   isLoading = false;
//       // });

//       // Handle the response from the API
//       if (response.statusCode == 200) {
//         Navigator.push(
//         context, MaterialPageRoute(builder: (context) => LoginScreen()));
//         print("Suceessful chat list");
//       } else {
//         // Registration failed, show an error message or handle the specific error
//         print("Errro in chat list");
//       }
//     }
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             Center(child: Text("Initializing chat ....")),
//             ElevatedButton(onPressed: (){
//               chatlistformation();
//             }, child: Text("Click e"))
//           ],
//         ),
//       ),
//     );
//   }
// }
class ChatInit extends StatefulWidget {
  const ChatInit({super.key});

  @override
  State<ChatInit> createState() => _ChatInitState();
}

class _ChatInitState extends State<ChatInit> {
  @override
  void initState() {
    super.initState();
    chatlistformation(); // Call the chatlistformation function here
  }

  

  void chatlistformation() async {
    final appState = Provider.of<AppState>(context, listen: false);

    final url =
        'https://surodishibackend-production.up.railway.app/api/user/chatlist';

    final userData = {
      '_id': appState.userID,
      'username': appState.userName,
      'userpic': appState.userPic,
      'targetid': appState.targetID,
      'name': appState.targetName,
      'pic': appState.targetPic,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    if (response.statusCode == 200) {
      Navigator.push(
          // context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    context, MaterialPageRoute(builder: (context) => LoginScreen()));

      print("Successful chat list");
    } else {
      print("Error in chat list");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Initializing chat ....")),
      ),
    );
  }
}

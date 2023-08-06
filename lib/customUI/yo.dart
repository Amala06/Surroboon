import 'package:flutter/material.dart';
import 'package:suro/chathome.dart';
import 'package:suro/chatmodel.dart';
import 'package:suro/constants.dart';
import 'package:suro/customUI/buttoncard.dart';
import 'package:provider/provider.dart';
import 'package:suro/appstate.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   late Future<List<Chatmodel>> futureChatmodels;
//     late Chatmodel sourcechat; // Define sourcechat here


//   // Fetch the login response and initialize chatmodels list
//   Future<List<Chatmodel>> fetchLoginResponse() async {
//     final appState = Provider.of<AppState>(context, listen: false);
//     final url ='https://surodishibackend-production.up.railway.app/api/user/singleuser';

//     final userData = {
//       '_id': appState.userID,
//     };

//     try {
//       final response = await http.post(Uri.parse(url),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode(userData));
//       if (response.statusCode == 200) {
//         final responseData = jsonDecode(response.body);
//         final chatmodels = responseData["participants"]
//             .map((participant) => Chatmodel(
//                 name: participant["name"],
//                 time: participant["time"],
//                 icon: participant["pic"],
//                 currentMessage: participant["message"],
//                 id: participant["targetid"]))
//             .toList();
//         return chatmodels;
//       } else {
//         print("API Call Failed - Status Code: ${response.statusCode}");
//         print("Error Response: ${response.body}");
//         return [];
//       }
//     } catch (e) {
//       print(e);
//       return [];
//     }
//   }
  

//   // Fetch the login response and initialize chatmodels list
//   Future<List<Chatmodel>> fetchLoginResponsee() async {
//     final appState = Provider.of<AppState>(context, listen: false);
//     final url =
//         'https://surodishibackend-production.up.railway.app/api/user/singleuser';

//     final userData = {
//       '_id': appState.userID,
//     };

//     try {
//       final response = await http.post(Uri.parse(url),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode(userData));
//       if (response.statusCode == 200) {
//         final responseData = jsonDecode(response.body);
//         final List<Chatmodel> chatmodels =
//             (responseData["participants"] as List)
//                 .map((participant) => Chatmodel(
//                     name: participant["name"],
//                     time: participant["time"],
//                     icon: participant["pic"],
//                     currentMessage: participant["message"],
//                     id: participant["targetid"]))
//                 .toList();
//         return chatmodels;
//       } else {
//         print("API Call Failed - Status Code: ${response.statusCode}");
//         print("Error Response: ${response.body}");
//         return [];
//       }
//     } catch (e) {
//       print(e);
//       return [];
//     }
//   }



//   @override
//   void initState() {
//     futureChatmodels = fetchLoginResponsee();
//         final appState = Provider.of<AppState>(context, listen: false);

//       sourcechat = Chatmodel(
//       name: appState.userName,
//       time: "00:00",
//       icon: appState.userPic,
//       currentMessage: "Default Message",
//       id: appState.userID,
//     );
    
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//        appBar: AppBar(
//         title: const Text(
//           "Confirm Your Name ",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: iconcolor,
//         actions: [
//           IconButton(
//             onPressed: null,
//             icon: Icon(Icons.search, color: Colors.white),
//           ),
//           PopupMenuButton<String>(
//             itemBuilder: (BuildContext context) {
//               return [
//                 PopupMenuItem(child: Text("Translate"), value: "Translate"),
//                 PopupMenuItem(child: Text("Setting"), value: "Setting"),
//               ];
//             },
//             onSelected: (String value) {
//               // Handle the selection of menu items here
//               print("Selected: $value");
//             },
//             icon: Icon(Icons.more_vert, color: Colors.white),
//           ),
//         ],
//       ),
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//           children:[
// Text("Select your name , to check whther you are robot or not"),
// // SizedBox(width: 20,),
//             Center(
//               child: FutureBuilder<List<Chatmodel>>(
//                 future: futureChatmodels,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     // API call is in progress, show a loading indicator
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     // API call returned an error, show an error message
//                     return Center(child: Text("Error: ${snapshot.error}"));
//                   } else {
//                     // API call is successful, display the ListView.builder
//                     final chatmodels = snapshot.data ?? [];
//                     return ListView.builder(
//                       itemCount: chatmodels.length,
                  
                      
//                       itemBuilder: (context, index) => InkWell(
//                         onTap: () {
//                         print(chatmodels[index]);
//                           final sourcechat = chatmodels[index];
//                           final updatedChatmodels = List<Chatmodel>.from(chatmodels)
//                             ..removeAt(index);
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (builder) => ChatHome(
//                                 chatmodels: updatedChatmodels,
//                                 sourcechat: sourcechat,
//                               ),
//                             ),
//                           );
//                         },
//                         child: ButtonCard(
//                           name: chatmodels[index].name,
//                           icon: Icons.person,
//                         ),
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),)
//     );
//   }
// }

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Future<List<Chatmodel>> futureChatmodels;
  late Chatmodel sourcechat; // Define sourcechat here

  // Fetch the login response and initialize chatmodels list
  Future<List<Chatmodel>> fetchLoginResponse() async {
    final appState = Provider.of<AppState>(context, listen: false);
    final url =
        'https://surodishibackend-production.up.railway.app/api/user/singleuser';

    final userData = {
      '_id': appState.userID,
    };

    try {
      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(userData));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final chatmodels = responseData["participants"]
            .map((participant) => Chatmodel(
                name: participant["name"],
                time: participant["time"],
                icon: participant["pic"],
                currentMessage: participant["message"],
                id: participant["targetid"]))
            .toList();
        return chatmodels;
      } else {
        print("API Call Failed - Status Code: ${response.statusCode}");
        print("Error Response: ${response.body}");
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  void initState() {
    futureChatmodels = fetchLoginResponse();
    final appState = Provider.of<AppState>(context, listen: false);

    sourcechat = Chatmodel(
      name: appState.userName,
      time: "00:00",
      icon: appState.userPic,
      currentMessage: "Default Message",
      id: appState.userID,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Confirm Your Name ",
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
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Please provide your name to undergo the verification process and confirm that you are a human user."),
            SizedBox(height: 16),
            FutureBuilder<List<Chatmodel>>(
              future: futureChatmodels,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // API call is in progress, show a loading indicator
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // API call returned an error, show an error message
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else {
                  // API call is successful, display the ListView.builder
                  final chatmodels = snapshot.data ?? [];
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: chatmodels.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        final sourcechat = chatmodels[index];
                        final updatedChatmodels =
                            List<Chatmodel>.from(chatmodels)..removeAt(index);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => ChatHome(
                              chatmodels: updatedChatmodels,
                              sourcechat: sourcechat,
                            ),
                          ),
                        );
                      },
                      child: ButtonCard(
                        name: chatmodels[index].name,
                        icon: Icons.person,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

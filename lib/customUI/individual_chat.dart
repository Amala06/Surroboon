import 'package:flutter/material.dart';
import 'package:suro/chatmodel.dart';
import 'package:suro/customUI/own_message.dart';
import 'package:suro/customUI/reply_msg.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:suro/model/messagemodel.dart';

class IndividualChat extends StatefulWidget {
  const IndividualChat({Key? key, this.chatmodel, this.sourcechat})
      : super(key: key);
  final Chatmodel? chatmodel;
  final Chatmodel? sourcechat;

  @override
  State<IndividualChat> createState() => _IndividualChatState();
}

class _IndividualChatState extends State<IndividualChat> {
  late IO.Socket socket;
  bool sendButton = false;
  List<MessageModel> messages = [];
  ScrollController _scrollController=ScrollController();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() {
    socket = IO.io("https://surroboon-backend-production.up.railway.app/", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    socket.onConnect((data) {
      print(data);
      print("Connected to socket server from frontend");
      socket.emit("signin", widget.sourcechat?.id);
      socket.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"]);
           _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);

      });

      print(socket.connected);
      // socket.emit("signin", "Hello World");
    });

    socket.onConnectError((data) {
      print("Connection error: $data");
    });

    socket.onDisconnect((data) {
      print("Disconnected: $data");
    });

    socket.connect();
  }

  void sendMessage(String message, int sourceId, int targetId) {
    setMessage("source", message);
    socket.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(message: message, type: type,time: DateTime.now().toString().substring(10,16));
    setState(() {
      setState(() {
        messages.add(messageModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 213, 226),
      appBar: AppBar(
        leadingWidth: 70,
        titleSpacing: 0,
        backgroundColor: Colors.pink,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back, size: 24, color: Colors.white),
              CircleAvatar(radius: 20, backgroundColor: Colors.white),
            ],
          ),
        ),
        title: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.chatmodel?.name ?? "Name Not Available",
                style: TextStyle(
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text("Last seen today at 12:05 ",
                  style: TextStyle(fontSize: 13, color: Colors.white))
            ],
          ),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                // height: MediaQuery.of(context).size.height - 140,
                // child: ListView(
                //   shrinkWrap: true,
                //   children: [
                //     // OwnMessage(),
                //     // Replymessage(),
                //     // OwnMessage(),
                //     // Replymessage(),
                //     // OwnMessage(),
                //     // Replymessage(),
                //     // OwnMessage(),
                //     // Replymessage(),
                //     // OwnMessage(),
                //     // Replymessage(),
                //     // OwnMessage(),
                //     // Replymessage(),
                //   ],
                // ),
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: messages.length+1,
                    itemBuilder: (context, index) {
                      if(index==messages.length){
                        return Container(
                          height: 70,
                        );
                      }
                      if (messages[index].type == "source") {
                        return OwnMessage(message: messages[index].message,time:messages[index].time);
                      } else {
                        return Replymessage(message: messages[index].message,time:messages[index].time);
                      }
                    }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width - 55,
                              child: Card(
                                  margin:
                                      EdgeInsets.only(left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: TextFormField(
                                    controller: _controller,
                                    // focusNode: true,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type a Message",
                                        contentPadding: EdgeInsets.all(15)),
                                  ))),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8, right: 3, left: 2),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.pink,
                              child: IconButton(
                                icon: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  
                                    _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
                                  
                                  sendMessage(_controller.text, widget.sourcechat!.id,
                                      widget.chatmodel!.id);
                                  _controller.clear();
                                 } ,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

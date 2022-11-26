import 'package:flutter/material.dart';
import 'package:frontend/components/customMessageCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/customMessageReplyCard.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../services/rest_api.dart';

class ChatingPage extends StatefulWidget {
  var userId;
  var user_name;

  ChatingPage({super.key, required this.userId, required this.user_name});
  // ignore: prefer_typing_uninitialized_variables

  @override
  _ChatingPageState createState() => _ChatingPageState();
}

class _ChatingPageState extends State<ChatingPage> {
  TextEditingController _messageController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  List messages = [];
  late IO.Socket socket;
  var userId;
  var user_name;

  Future<void> connect() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var senderId = sharedPreferences.getString("user_id");
    socket = IO.io(
        'http://192.168.137.1:3000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket.connect();
    socket.emit("signin", (senderId));
    setUpSocketListener();
  }

  Future<void> sendMessage(String message, String receiverId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var senderId = sharedPreferences.getString("user_id");

    var dataJson = {
      "sender": senderId,
      "receiver": receiverId,
      "message": message
    };
    // send massege to server
    socket.emit("message", dataJson);
    if (dataJson != null) {
      setMessage(dataJson);
    }
    return;
  }

  void setUpSocketListener() {
    // recive message from server
    socket.on("message-receive", (data) {
      if (data['message'] == null) {
        return;
      }
      setMessage(data);
    });
  }

  void setMessage(var message) {
    // set message to list
    setState(() {
      messages.add(message);
    });
  }

  void getMessages(userId) async {
    // fetch messages from db
    var chats = await ApiService.findOrAddRoom(userId);
    if (chats['messages'] != null) {
      chats['messages'].map((chat) {
        setState(() {
          messages.add(chat);
        });
      }).toList();
    }
  }

  @override
  void initState() {
    connect();

    getMessages(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shadowColor: const Color.fromARGB(255, 111, 8, 143),
          elevation: 10,
          title: Text(
            widget.user_name,
            style: const TextStyle(
              color: Color.fromARGB(200, 92, 225, 230),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: const BackButton(
            color: Color.fromARGB(255, 111, 8, 143),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      if (messages[index]['receiver'] == widget.userId) {
                        if (messages[index]['message'] != null) {
                          return messageCard(
                              message: messages[index]['message']);
                        }
                        return Container();
                      }
                      if (messages[index]['sender'] == widget.userId) {
                        if (messages[index]['message'] != null) {
                          return replyMessageCard(
                              message: messages[index]['message']);
                        }
                        return Container();
                      } else {
                        return Container();
                      }
                    }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 55,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  left: 3, right: 3, bottom: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: TextFormField(
                                controller: _messageController,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                decoration: const InputDecoration(
                                    hintText: "type a message",
                                    contentPadding: EdgeInsets.only(
                                        top: 10,
                                        left: 20,
                                        right: 10,
                                        bottom: 10)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 111, 8, 143),
                              radius: 25,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.send,
                                  color: Color.fromARGB(200, 92, 225, 230),
                                ),
                                onPressed: () async {
                                  _scrollController.animateTo(
                                    _scrollController.position.maxScrollExtent,
                                    curve: Curves.easeOut,
                                    duration: Duration(milliseconds: 300),
                                  );
                                  print(widget.userId);
                                  sendMessage(
                                      _messageController.text, widget.userId);
                                  await ApiService.sendMessage(
                                      widget.userId, _messageController.text);
                                  _messageController.clear();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

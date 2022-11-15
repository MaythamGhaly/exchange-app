import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:frontend/provider/dark_theme_provider.dart';
import 'package:frontend/components/customMessageCard.dart';
import 'package:frontend/components/customTextForm.dart';
import 'package:frontend/screens/basePage.dart';
import 'package:frontend/screens/register.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/customButton.dart';
import '../components/customMessageReplyCard.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatingPage extends StatefulWidget {
  var client;

  ChatingPage({super.key, required this.client});
  // ignore: prefer_typing_uninitialized_variables

  @override
  _ChatingPageState createState() => _ChatingPageState();
}

class _ChatingPageState extends State<ChatingPage> {
  TextEditingController _messageController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  List masseges = [];
  late IO.Socket socket;
  var client;
  Future<void> connect() async {
    socket = IO.io(
        'http://192.168.137.1:3000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket.connect();
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
    socket.emit("message", dataJson);
    setMassege(dataJson);
  }

  void setUpSocketListener() {
    socket.on("message-receive", (data) {
      setMassege(data);
    });
  }

  void setMassege(var massege) {
    setState(() {
      masseges.add(massege);
    });
  }

  @override
  void initState() {
    connect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shadowColor: const Color.fromARGB(255, 111, 8, 143),
          elevation: 10,
          title: const Text(
            'Maytham',
            style: TextStyle(
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
                    itemCount: masseges.length,
                    itemBuilder: (context, index) {
                      if (masseges[index]['receiver'] ==
                          widget.client['user']['_id']) {
                        return messageCard(message: masseges[index]['message']);
                      }
                      if (masseges[index]['sender'] ==
                          widget.client['user']['_id']) {
                        return replyMessageCard(
                            message: masseges[index]['message']);
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
                                onPressed: () {
                                  _scrollController.animateTo(
                                    _scrollController.position.maxScrollExtent,
                                    curve: Curves.easeOut,
                                    duration: Duration(milliseconds: 300),
                                  );
                                  sendMessage(_messageController.text,
                                      widget.client['user']['_id']);
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

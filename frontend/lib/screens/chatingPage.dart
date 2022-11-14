import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:frontend/provider/dark_theme_provider.dart';
import 'package:frontend/components/customMessageCard.dart';
import 'package:frontend/components/customTextForm.dart';
import 'package:frontend/screens/basePage.dart';
import 'package:frontend/screens/register.dart';
import 'package:provider/provider.dart';
import '../components/customButton.dart';
import '../components/customMessageReplyCard.dart';

class ChatingPage extends StatefulWidget {
  const ChatingPage({super.key});

  @override
  _ChatingPageState createState() => _ChatingPageState();
}

class _ChatingPageState extends State<ChatingPage> {
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
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 140,
                child: ListView(
                  children: [
                    messageCard(),
                    replyMessageCard(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
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
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          decoration: const InputDecoration(
                              hintText: "type a message",
                              contentPadding: EdgeInsets.only(
                                  top: 10, left: 20, right: 10, bottom: 10)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 111, 8, 143),
                        radius: 25,
                        child: IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: Color.fromARGB(200, 92, 225, 230),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

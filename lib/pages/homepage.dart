import 'package:flutter/material.dart';
import 'package:mirko/models/message.dart';
import 'package:mirko/models/text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _message = [
    Message(text: 'Hello', isUser: true),
    Message(text: 'Hi, what\'s up?', isUser: false),
    Message(text: 'Great, and you?', isUser: true),
    Message(text: 'great', isUser: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _message.length,
              itemBuilder: (context, index) {
                final message = _message[index];
                return ListTile(
                  title: Align(
                    alignment: message.isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 15, right: 15),
                      decoration: BoxDecoration(
                        color: message.isUser
                            ? const Color(0xffF2E3D5)
                            : const Color(0xff796878),
                        borderRadius: message.isUser
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(14),
                                bottomLeft: Radius.circular(14),
                                topRight: Radius.circular(14),
                              )
                            : const BorderRadius.only(
                                topLeft: Radius.circular(14),
                                topRight: Radius.circular(14),
                                bottomRight: Radius.circular(14),
                              ),
                      ),
                      child: Text(
                        message.text,
                        style: TextStyle(
                          color: message.isUser
                              ? const Color(0xff4A4A4A)
                              : Colors.white,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    maxLines: null,
                    controller: _controller,
                    keyboardType: TextInputType.multiline,
                    style: TextModel.chat,
                    cursorColor: const Color(0xff4A4A4A),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Write your message here',
                      hintStyle: TextModel.hint,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

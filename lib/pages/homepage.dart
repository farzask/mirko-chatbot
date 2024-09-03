import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:mirko/models/message.dart';
import 'package:mirko/models/text.dart';
import 'package:mirko/models/themenotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _message = [];

  callGeminiModel() async {
    try {
      if (_controller.text.isNotEmpty) {
        _message.add(Message(text: _controller.text, isUser: true));
      }
      final model = GenerativeModel(
          model: 'gemini-pro', apiKey: dotenv.env['GOOGLE_API_KEY']!);
      final prompt = _controller.text.trim();
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      _controller.clear();
      setState(
        () {
          _message.add(Message(text: response.text!, isUser: false));
        },
      );
    } catch (e) {
      print('Error : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode currentTheme = ThemeMode.light;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            child: (currentTheme == ThemeMode.dark)
                ? Icon(
                    Icons.light_mode,
                    color: Theme.of(context).colorScheme.secondary,
                  )
                : Icon(
                    Icons.dark_mode,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            onTap: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
          ),
        ),
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
                  onPressed: () {
                    callGeminiModel();
                  },
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

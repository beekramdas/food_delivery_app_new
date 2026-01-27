import 'package:flutter/material.dart';

class MyChatApp extends StatelessWidget {
  const MyChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  // Each message has text and a status: "sent", "delivered", "seen"
  List<Map<String, dynamic>> messages = [];

  void _sendMessage() {
    if (_controller.text.isEmpty) return;

    setState(() {
      messages.add({
        "text": _controller.text,
        "status": "sent", // initially sent
      });
      _controller.clear();
    });

    int index = messages.length - 1;

    // Simulate delivery after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          messages[index]["status"] = "delivered";
        });
      }
    });

    // Simulate seen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          messages[index]["status"] = "seen";
        });
      }
    });
  }

  Icon _getStatusIcon(String status) {
    switch (status) {
      case "sent":
        return const Icon(Icons.access_time, size: 16, color: Colors.grey);
      case "delivered":
        return const Icon(Icons.check, size: 16, color: Colors.grey);
      case "seen":
        return const Icon(Icons.done_all, size: 16, color: Colors.blue);
      default:
        return const Icon(Icons.error, size: 16, color: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Chat"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          // Messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                String status = messages[index]["status"];
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(messages[index]["text"]),
                        const SizedBox(width: 5),
                        _getStatusIcon(status),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Input field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.teal),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

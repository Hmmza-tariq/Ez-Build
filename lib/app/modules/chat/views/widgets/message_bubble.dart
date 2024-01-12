import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String messageTxt;
  final String messageSender;
  final bool isMe;

  const MessageBubble(
      {super.key,
      required this.messageTxt,
      required this.messageSender,
      required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          messageSender,
          style: const TextStyle(color: Colors.black54, fontSize: 12),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.only(
                topLeft: isMe
                    ? const Radius.circular(30.0)
                    : const Radius.circular(0),
                bottomLeft: const Radius.circular(30.0),
                bottomRight: const Radius.circular(30.0),
                topRight: isMe
                    ? const Radius.circular(0)
                    : const Radius.circular(30)),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                messageTxt,
                style: TextStyle(
                    color: isMe ? Colors.white : Colors.black54, fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

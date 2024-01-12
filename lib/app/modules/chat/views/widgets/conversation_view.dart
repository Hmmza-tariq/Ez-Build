import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_build/app/modules/Chat/controllers/chat_controller.dart';
import 'package:ez_build/app/modules/Chat/views/chat_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ConversationView extends GetView<ChatController> {
  const ConversationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                controller.auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: controller.firestore
                  .collection('messages')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.lightBlueAccent,
                  ));
                }
                final messages = snapshot.data?.docs;
                List<MessageBubble> messageBubbles = [];
                for (var msg in messages!) {
                  final messageTxt =
                      (msg.data() as Map<String, dynamic>)['text'];
                  final messageSender =
                      (msg.data() as Map<String, dynamic>)['sender'];
                  final currentUser = controller.loggedInUser.email;

                  final messageBubble = MessageBubble(
                    messageSender: messageSender,
                    messageTxt: messageTxt,
                    isMe: currentUser == messageSender,
                  );
                  messageBubbles.add(messageBubble);
                }
                return Expanded(
                  child: ListView(
                    reverse: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    children: messageBubbles,
                  ),
                );
              },
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: controller.messageTextController,
                      onChanged: (value) {
                        controller.messageText = value;
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        hintText: 'Type your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.messageTextController.clear();
                      controller.firestore.collection('messages').add(
                        {
                          'text': controller.messageText,
                          'sender': controller.loggedInUser.email,
                          'createdAt': DateTime.now(),
                        },
                      );
                    },
                    child: const Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

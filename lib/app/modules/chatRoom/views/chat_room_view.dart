import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_build/app/modules/Chat/views/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  const ChatRoomView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: CircleAvatar(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
                radius: 20,
                child: SvgPicture.asset(controller.otherUser.image,
                    fit: BoxFit.none),
              ),
              onPressed: () {
                Get.back();
              }),
        ],
        title: Text(controller.otherUser.name),
        backgroundColor: Theme.of(context).primaryColor,
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
                  return Expanded(
                    child: Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                    )),
                  );
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
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      cursorColor: Theme.of(context).primaryColor,
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
                    child: Text(
                      'Send',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
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

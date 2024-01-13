import 'package:ez_build/app/modules/Chat/controllers/chat_controller.dart';
import 'package:ez_build/app/modules/chat/views/widgets/chat_user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //app bar
        appBar: AppBar(
          title: const Text('Chat'),
          actions: [
            //search user button
            IconButton(
                onPressed: () => controller.toggleSearching(),
                icon: Icon(controller.isSearching
                    ? CupertinoIcons.clear_circled_solid
                    : Icons.search)),

            //more features button
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),

        //floating button to add new user
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FloatingActionButton(
              onPressed: () {
                controller.addChatUserDialog(context);
              },
              child: const Icon(Icons.add_comment_rounded)),
        ),

        //body
        body: ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              return ChatUserCard(
                user: controller.list[index],
              );
            }));
  }
}

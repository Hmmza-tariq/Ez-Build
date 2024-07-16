import 'package:ez_build/app/modules/Chat/controllers/chat_controller.dart';
import 'package:ez_build/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //app bar
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text('Chat',
              style: TextStyle(
                  color: context.theme.textTheme.displayMedium?.color)),
          actions: [
            //search user button
            IconButton(
                onPressed: () => controller.toggleSearching(),
                icon: Icon(
                    controller.isSearching
                        ? CupertinoIcons.clear_circled_solid
                        : Icons.search,
                    color: context.theme.textTheme.displayMedium?.color)),

            //more features button
            IconButton(
                onPressed: () {
                  // controller.showMoreFeatures(context);
                },
                icon: Icon(Icons.more_vert,
                    color: context.theme.textTheme.displayMedium?.color)),
          ],
        ),

        //floating button to add new user
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.only(bottom: 10),
        //   child: FloatingActionButton(
        //       onPressed: () {
        //         controller.addChatUserDialog(context);
        //       },
        //       child: const Icon(Icons.add_comment_rounded)),
        // ),

        //body
        body: ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              return ListTile(
                  dense: true,
                  selectedColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onTap: () {
                    Get.toNamed(Routes.CHAT_ROOM,
                        arguments: controller.list[index]);
                  },
                  leading: CircleAvatar(
                      radius: 25,
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: SvgPicture.asset(controller.list[index].image,
                          fit: BoxFit.none)),
                  title: Text(controller.list[index].name),
                  subtitle: Text(controller.list[index].lastMessage),
                  trailing: Text(controller.list[index].lastMessageTime));
            }));
  }
}

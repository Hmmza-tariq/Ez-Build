import 'package:ez_build/app/data/api/apis.dart';
import 'package:ez_build/app/modules/Chat/controllers/chat_controller.dart';
import 'package:ez_build/app/modules/chat/views/widgets/chat_user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //for hiding keyboard when a tap is detected on screen
      onTap: () => FocusScope.of(context).unfocus(),
      // child: WillPopScope(a
      //   //if search is on & back button is pressed then close search
      //   //or else simple close current screen on back button click
      //   onWillPop: () {
      //     if (controller.isSearching) {
      //       setState(() {
      //    ler.isSearching = !controller.isSearching;
      //       });
      //       return Future.value(false);
      //     } else {
      //       return Future.value(true);
      //     }
      //   },
      child: Scaffold(
        //app bar
        appBar: AppBar(
          leading: const Icon(CupertinoIcons.home),
          title: controller.isSearching
              ? TextField(
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Name, Email, ...'),
                  autofocus: true,
                  style: const TextStyle(fontSize: 17, letterSpacing: 0.5),
                  //when search text changes then updated search list
                  onChanged: (val) {
                    //search logic
                    // controller.searchList.clear();

                    for (var i in controller.list) {
                      if (i.name.toLowerCase().contains(val.toLowerCase()) ||
                          i.email.toLowerCase().contains(val.toLowerCase())) {
                        controller.searchList.add(i);
                        controller.searchList;
                      }
                    }
                  },
                )
              : const Text('We Chat'),
          actions: [
            //search user button
            IconButton(
                onPressed: () => controller.toggleSearching(),
                icon: Icon(controller.isSearching
                    ? CupertinoIcons.clear_circled_solid
                    : Icons.search)),

            //more features button
            IconButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => ProfileScreen(user: APIs.me)));
                },
                icon: const Icon(Icons.more_vert))
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
        body: StreamBuilder(
          stream: APIs.getMyUsersId(),

          //get id of only known users
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              //if data is loading
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(child: CircularProgressIndicator());

              //if some or all data is loaded then show it
              case ConnectionState.active:
              case ConnectionState.done:
                return StreamBuilder(
                  stream: APIs.getAllUsers(
                      snapshot.data?.docs.map((e) => e.id).toList() ?? []),

                  //get only those user, who's ids are provided
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      //if data is loading
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                      // return const Center(
                      //     child: CircularProgressIndicator());

                      //if some or all data is loaded then show it
                      case ConnectionState.active:
                      case ConnectionState.done:
                        // final data = snapshot.data?.docs;
                        // controller.list = data
                        //         ?.map((e) => ChatUser.fromJson(e.data()))
                        //         .toList() ??
                        //     [];

                        if (controller.list.isNotEmpty) {
                          return ListView.builder(
                              itemCount: controller.isSearching
                                  ? controller.searchList.length
                                  : controller.list.length,
                              padding: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).height * .01),
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ChatUserCard(
                                    user: controller.isSearching
                                        ? controller.searchList[index]
                                        : controller.list[index]);
                              });
                        } else {
                          return const Center(
                            child: Text('No Connections Found!',
                                style: TextStyle(fontSize: 20)),
                          );
                        }
                    }
                  },
                );
            }
          },
        ),
      ),
      // ),
    );
  }
}

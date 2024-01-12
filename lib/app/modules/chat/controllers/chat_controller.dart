import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_build/app/data/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final messageTextController = TextEditingController();
  late User loggedInUser;
  late String messageText;
  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  get firestore => _firestore;
  get auth => _auth;
  void getCurrentUser() async {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // for storing all users
  final List<ChatUser> list = [];

  // for storing searched items
  final List<ChatUser> searchList = [];
  // for storing search status
  final bool isSearching = false;

  // void initState() {
  //   super.initState();
  //   APIs.getSelfInfo();

  //   //for updating user active status according to lifecycle events
  //   //resume -- active or online
  //   //pause  -- inactive or offline
  //   SystemChannels.lifecycle.setMessageHandler((message) {
  //     log('Message: $message');

  //     if (APIs.auth.currentUser != null) {
  //       if (message.toString().contains('resume')) {
  //         APIs.updateActiveStatus(true);
  //       }
  //       if (message.toString().contains('pause')) {
  //         APIs.updateActiveStatus(false);
  //       }
  //     }

  //     return Future.value(message);
  //   });
  // }'
   // for adding new chat user
  // void _addChatUserDialog() {
  //   String email = '';

  //   showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //             contentPadding: const EdgeInsets.only(
  //                 left: 24, right: 24, top: 20, bottom: 10),

  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(20)),

  //             //title
  //             title: Row(
  //               children: const [
  //                 Icon(
  //                   Icons.person_add,
  //                   color: Colors.blue,
  //                   size: 28,
  //                 ),
  //                 Text('  Add User')
  //               ],
  //             ),

  //             //content
  //             content: TextFormField(
  //               maxLines: null,
  //               onChanged: (value) => email = value,
  //               decoration: InputDecoration(
  //                   hintText: 'Email Id',
  //                   prefixIcon: const Icon(Icons.email, color: Colors.blue),
  //                   border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(15))),
  //             ),

  //             //actions
  //             actions: [
  //               //cancel button
  //               MaterialButton(
  //                   onPressed: () {
  //                     //hide alert dialog
  //                     Navigator.pop(context);
  //                   },
  //                   child: const Text('Cancel',
  //                       style: TextStyle(color: Colors.blue, fontSize: 16))),

  //               //add button
  //               MaterialButton(
  //                   onPressed: () async {
  //                     //hide alert dialog
  //                     Navigator.pop(context);
  //                     if (email.isNotEmpty) {
  //                       await APIs.addChatUser(email).then((value) {
  //                         if (!value) {
  //                           Dialogs.showSnackbar(
  //                               context, 'User does not Exists!');
  //                         }
  //                       });
  //                     }
  //                   },
  //                   child: const Text(
  //                     'Add',
  //                     style: TextStyle(color: Colors.blue, fontSize: 16),
  //                   ))
  //             ],
  //           ));
  // }

}

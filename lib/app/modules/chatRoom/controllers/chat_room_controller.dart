import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_build/app/data/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final messageTextController = TextEditingController();
  late User loggedInUser;
  late String messageText;

  get firestore => _firestore;
  get auth => _auth;
  get otherUser => Get.arguments as ChatUser;
  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

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
}

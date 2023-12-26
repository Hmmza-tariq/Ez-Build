import 'package:cloud_firestore/cloud_firestore.dart';
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
}

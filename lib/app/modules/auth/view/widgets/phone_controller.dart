import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class PhoneController extends GetxController {
  String phone = '';
  String id = '';
  String otp = '';
  bool isEntered = false;

  void setPhone(String value) {
    phone = value;
    update(['Phone']);
  }

  void setIsEntered() {
    isEntered = true;
    update(['Phone']);
  }

  Future<String?> authUserWithPhone() async {
    final auth = FirebaseAuth.instance;
    debugPrint('phone: $phone');
    try {
      if (phone == '' ||
          phone.isEmpty ||
          phone.length < 11 ||
          phone.length > 13 ||
          (phone[0] != '0' &&
              !phone.startsWith('+92') &&
              !phone.startsWith('92'))) {
        return _getError('Invalid phone number');
      }

      if (phone.startsWith('0')) {
        phone = '+92${phone.substring(1)}';
      } else if (phone.startsWith('92')) {
        phone = '+$phone';
      }
      debugPrint('final phone: $phone');
      await auth
          .verifyPhoneNumber(
              phoneNumber: phone,
              verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
                setIsEntered();
              },
              verificationFailed: (FirebaseAuthException error) {
                _getError(error.toString());
              },
              codeSent: (String verificationId, int? forceResendingToken) {
                id = verificationId;
                setIsEntered();
              },
              codeAutoRetrievalTimeout: (String verificationId) {})
          .then((value) {
        return null;
      });
    } catch (e) {
      return _getError(e.toString());
    }
    return null;
  }

  Future<String?> authUserWithOTP() async {
    final auth = FirebaseAuth.instance;
    try {
      await auth
          .signInWithCredential(
              PhoneAuthProvider.credential(verificationId: id, smsCode: otp))
          .then((value) {
        return null;
      });
    } catch (e) {
      return _getError(e.toString());
    }
    return null;
  }

  Future<String?> recoverPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      return _getError(e.message!);
    }
  }

  String _getError(String error) {
    debugPrint('error: $error');
    if (error.contains('credential is incorrect')) {
      return 'Incorrect credentials';
    } else if (error.contains('Invalid phone number')) {
      return 'Invalid phone number';
    } else if (error.contains('user-not-found')) {
      return 'User not found';
    } else if (error.contains('user-disabled')) {
      return 'User disabled';
    } else if (error.contains('A network error')) {
      return 'Network error';
    } else if (error
        .contains('The verification code from SMS/TOTP is invalid')) {
      return 'Invalid OTP';
    } else if (error.contains('The sms code has expired')) {
      return 'OTP expired';
    } else {
      return 'Unknown error';
    }
  }
}

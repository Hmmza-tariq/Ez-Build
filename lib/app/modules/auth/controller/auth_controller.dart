import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isPhone = false;
  @override
  void onInit() async {
    //Get.offNamed(Routes.BASE);

    super.onInit();
  }

  void changeAuthType() {
    isPhone = !isPhone;
    update(['AuthType']);
  }

  Future<String?> authUser(LoginData data) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth
          .signInWithEmailAndPassword(email: data.name, password: data.password)
          .then((value) {
        return null;
      });
    } catch (e) {
      return _getError(e.toString());
    }
    return 'Error';
  }

  Future<String?> signupUser(SignupData data) async {
    final auth = FirebaseAuth.instance;

    try {
      await auth.createUserWithEmailAndPassword(
          email: data.name!, password: data.password!);
      return null;
    } catch (e) {
      return _getError(e.toString());
    }
  }

  Future<String?> signupGoogle() async {
    final auth = FirebaseAuth.instance;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await auth.signInWithCredential(credential);
        return null;
      }
    } catch (e) {
      return _getError(e.toString());
    }
    return 'Error';
  }

  Future<String?> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success) {
        final AccessToken accessToken = loginResult.accessToken!;
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);
        await FirebaseAuth.instance.signInWithCredential(credential);
        return null;
      } else {
        throw FirebaseAuthException(
          code: 'Facebook Login Failed',
          message: 'The Facebook login was not successful.',
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
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
    } else if (error.contains('email-already-in-use')) {
      return 'Email already in use';
    } else if (error.contains('invalid-email')) {
      return 'Invalid email';
    } else if (error.contains('weak-password')) {
      return 'Weak password';
    } else if (error.contains('user-not-found')) {
      return 'User not found';
    } else if (error.contains('wrong-password')) {
      return 'Wrong password';
    } else if (error.contains('user-disabled')) {
      return 'User disabled';
    } else if (error.contains('A network error')) {
      return 'Network error';
    } else {
      return 'Unknown error';
    }
  }
}

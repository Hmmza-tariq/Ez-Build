import 'package:ez_build/app/routes/app_pages.dart';
import 'package:ez_build/config/provider/strings.dart';
import 'package:ez_build/utils/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
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

  Future<String?> _signupUser(SignupData data) async {
    final auth = FirebaseAuth.instance;

    try {
      await auth.createUserWithEmailAndPassword(
          email: data.name!, password: data.password!);
      return null;
    } catch (e) {
      return _getError(e.toString());
    }
  }

  Future<String?> _signupGoogle() async {
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

  Future<String?> _recoverPassword(String email) async {
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

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: Provider.of<StringsManager>(context).appName,
      logo: const AssetImage(AssetsManager.logo),
      onLogin: _authUser,
      onSignup: _signupUser,
      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: FontAwesomeIcons.google,
          callback: _signupGoogle,
        ),
        LoginProvider(
          icon: FontAwesomeIcons.facebookF,
          // label: 'Facebook',
          callback: () async {
            debugPrint('start facebook sign in');
            await Future.delayed(loginTime);
            debugPrint('stop facebook sign in');
            return null;
          },
        ),
      ],
      onSubmitAnimationCompleted: () {
        FocusScope.of(context).unfocus();
        Get.offNamed(Routes.BASE);
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}

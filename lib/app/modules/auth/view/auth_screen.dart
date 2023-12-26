import 'package:ez_build/app/modules/auth/controller/auth_controller.dart';
import 'package:ez_build/app/routes/app_pages.dart';
import 'package:ez_build/config/provider/strings_manager.dart';
import 'package:ez_build/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      id: 'AuthType',
      builder: (_) {
        return FlutterLogin(
          title: Provider.of<StringsManager>(context).appName,
          logo: const AssetImage(AssetsManager.logo),
          onLogin: controller.authUser,
          onSignup: controller.signupUser,
          userType: LoginUserType.email,
          loginProviders: <LoginProvider>[
            LoginProvider(
              icon: FontAwesomeIcons.google,
              callback: controller.signupGoogle,
            ),
            LoginProvider(
              icon: FontAwesomeIcons.apple,
              callback: () async {
                return null;
              },
            ),
            // LoginProvider(
            //   icon: FontAwesomeIcons.facebookF,
            //   // label: 'Facebook',
            //   callback: controller.signInWithFacebook,
            // ),
          ],
          onSubmitAnimationCompleted: () {
            FocusScope.of(context).unfocus();
            Get.offNamed(Routes.BASE);
          },
          onRecoverPassword: controller.recoverPassword,
          headerWidget: Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Get.toNamed(Routes.PHONE);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Text(
                    'Use Phone?',
                    style: context.theme.textTheme.displayMedium?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

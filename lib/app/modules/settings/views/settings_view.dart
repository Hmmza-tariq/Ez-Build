import 'package:ez_build/config/provider/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../utils/assets.dart';
import '../../../components/screen_title.dart';
import '../controllers/settings_controller.dart';
import 'widgets/settings_item.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            30.verticalSpace,
            ScreenTitle(
              title: Provider.of<StringsManager>(context).settings,
              dividerEndIndent: 230,
            ),
            20.verticalSpace,
            Text(Provider.of<StringsManager>(context).account,
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                )),
            20.verticalSpace,
            SettingsItem(
              title: Provider.of<StringsManager>(context).profileName,
              icon: AssetsManager.userIcon,
              isAccount: true,
              description: Provider.of<StringsManager>(context).phoneNumber,
            ),
            30.verticalSpace,
            Text(Provider.of<StringsManager>(context).settings,
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                )),
            20.verticalSpace,
            SettingsItem(
              title: Provider.of<StringsManager>(context).darkMode,
              icon: AssetsManager.themeIcon,
              isDark: true,
              description: '',
            ),
            25.verticalSpace,
            SettingsItem(
              title:
                  '${Provider.of<StringsManager>(context).language} - ${Provider.of<StringsManager>(context).currentLanguage}',
              icon: AssetsManager.languageIcon,
              isLanguage: true,
              description: '',
            ),
            25.verticalSpace,
            SettingsItem(
              title: Provider.of<StringsManager>(context).help,
              icon: AssetsManager.helpIcon,
              description: '',
            ),
            25.verticalSpace,
            SettingsItem(
              title: Provider.of<StringsManager>(context).logout,
              icon: AssetsManager.logoutIcon,
              description: '',
              onTap: () => FirebaseAuth.instance.signOut(),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

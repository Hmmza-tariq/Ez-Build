import 'package:ez_build/config/provider/strings_manager.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../config/theme/my_theme.dart';
import '../../../data/local/my_shared_pref.dart';

class SettingsController extends GetxController {
  // get is light theme from shared pref
  var isLightTheme = MySharedPref.getThemeIsLight();
  var isUrdu = MySharedPref.getIsUrdu();

  /// change the system theme
  changeTheme(bool value) {
    MyTheme.changeTheme();
    isLightTheme = MySharedPref.getThemeIsLight();
    update(['Theme']);
  }

  void changeLanguage(bool value) {
    Provider.of<StringsManager>(Get.context!, listen: false).toggleLanguage();
    MySharedPref.setIsUrdu(!isUrdu);
    isUrdu = MySharedPref.getIsUrdu();
    update(['Language']);
  }
}

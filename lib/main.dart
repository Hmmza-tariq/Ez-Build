import 'package:ez_build/config/provider/strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'app/data/local/my_shared_pref.dart';
import 'app/routes/app_pages.dart';
import 'config/theme/my_theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MySharedPref.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<StringsManager>(
          create: (_) => StringsManager(MySharedPref.getIsUrdu(),
              location: MySharedPref.getLocation()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        useInheritedMediaQuery: true,
        rebuildFactor: (old, data) => true,
        builder: (context, widget) {
          return GetMaterialApp(
            title: Provider.of<StringsManager>(context).appName,
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              bool themeIsLight = MySharedPref.getThemeIsLight();
              return Theme(
                data: MyTheme.getThemeData(isLight: themeIsLight),
                child: MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: widget!,
                ),
              );
            },
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        },
      ),
    ),
  );
}

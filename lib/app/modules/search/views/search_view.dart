import 'package:ez_build/config/provider/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../components/screen_title.dart';
import '../controllers/search_controller.dart';
import 'widgets/notification_item.dart';

class SearchView extends GetView<SearchesController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            30.verticalSpace,
            ScreenTitle(
              title: Provider.of<StringsManager>(context).notifications,
              dividerEndIndent: 150,
            ),
            10.verticalSpace,
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) =>
                  const SearchItem().animate().fade().slideY(
                        duration: const Duration(milliseconds: 300),
                        begin: 1,
                        curve: Curves.easeInSine,
                      ),
              shrinkWrap: true,
              primary: false,
            ),
          ],
        ),
      ),
    );
  }
}

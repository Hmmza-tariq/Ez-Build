import 'package:ez_build/app/components/screen_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 60.h),
            child: const ScreenTitle(
              title: 'Profile',
              dividerEndIndent: 200,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      cursorColor: color,
                      initialValue: controller.name,
                      decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: context.theme.textTheme.displayMedium
                              ?.copyWith(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: context
                                      .theme.textTheme.displayMedium!.color!)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: color))),
                      onChanged: (value) => controller.name = value,
                    ),
                    TextFormField(
                      cursorColor: color,
                      initialValue: controller.phone,
                      decoration: InputDecoration(
                          labelText: 'Phone',
                          labelStyle: context.theme.textTheme.displayMedium
                              ?.copyWith(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: context
                                      .theme.textTheme.displayMedium!.color!)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: color))),
                      onChanged: (value) => controller.phone = value,
                    ),
                    TextFormField(
                      cursorColor: color,
                      initialValue: controller.address,
                      decoration: InputDecoration(
                          labelText: 'Address',
                          labelStyle: context.theme.textTheme.displayMedium
                              ?.copyWith(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: context
                                      .theme.textTheme.displayMedium!.color!)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: color))),
                      onChanged: (value) => controller.address = value,
                    ),

                    // DropdownButtonFormField<ProfileTypes>(
                    //   value: controller.category,
                    //   decoration: const InputDecoration(labelText: 'Category'),
                    //   items: ProfileTypes.values.map((ProfileTypes category) {
                    //     return DropdownMenuItem<ProfileTypes>(
                    //       value: category,
                    //       child: Text(category.toString()),
                    //     );
                    //   }).toList(),
                    //   onChanged: (ProfileTypes? newValue) {
                    //     if (newValue != null) {
                    //       controller.category = newValue;
                    //     }
                    //   },
                    // ),
                    // Add more fields for the products here
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

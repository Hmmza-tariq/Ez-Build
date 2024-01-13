import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                cursorColor: color,
                initialValue: controller.name,
                decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: const TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: color))),
                onChanged: (value) => controller.name = value,
              ),
              TextFormField(
                cursorColor: color,
                initialValue: controller.phone,
                decoration: InputDecoration(
                    labelText: 'Phone',
                    labelStyle: const TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: color))),
                onChanged: (value) => controller.phone = value,
              ),
              TextFormField(
                cursorColor: color,
                initialValue: controller.address,
                decoration: InputDecoration(
                    labelText: 'Address',
                    labelStyle: const TextStyle(color: Colors.white),
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
    );
  }
}

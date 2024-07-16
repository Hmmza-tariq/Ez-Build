import 'dart:io';

import 'package:ez_build/app/components/screen_title.dart';
import 'package:ez_build/utils/dummy_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/add_item_controller.dart';

class AddItemView extends GetView<AddItemController> {
  const AddItemView({super.key});
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100.h,
            padding: EdgeInsets.only(left: 20.w, top: 10.h),
            child: const ScreenTitle(
              title: 'Add Product',
              dividerEndIndent: 200,
            ),
          ),
          Expanded(
            child: Form(
              key: controller.formKey,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: <Widget>[
                  SizedBox(
                    height: 300.h,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.imagesPath.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        return GetBuilder<AddItemController>(
                          init: AddItemController(),
                          id: 'Image',
                          builder: (_) {
                            return SizedBox(
                              child: GestureDetector(
                                onTap: controller.pickImage,
                                child: AbsorbPointer(
                                    child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: controller.imagesPath[index].isEmpty
                                        ? const Icon(Icons.add_a_photo)
                                        : Image.file(
                                            File(controller.imagesPath[index]),
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                )),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  TextFormField(
                    cursorColor: color,
                    controller: controller.titleController,
                    decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: context.theme.textTheme.displayMedium
                            ?.copyWith(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: context
                                    .theme.textTheme.displayMedium!.color!)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: color))),
                  ),
                  TextFormField(
                    cursorColor: color,
                    controller: controller.descriptionController,
                    decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: context.theme.textTheme.displayMedium
                            ?.copyWith(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: context
                                    .theme.textTheme.displayMedium!.color!)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: color))),
                    // Add validation logic here
                  ),
                  TextFormField(
                    cursorColor: color,
                    keyboardType: TextInputType.number,
                    controller: controller.priceController,
                    decoration: InputDecoration(
                        labelText: 'Price',
                        labelStyle: context.theme.textTheme.displayMedium
                            ?.copyWith(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: context
                                    .theme.textTheme.displayMedium!.color!)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: color))),
                    // Add validation logic here
                  ),
                  TextFormField(
                    cursorColor: color,
                    keyboardType: TextInputType.number,
                    controller: controller.quantityController,
                    decoration: InputDecoration(
                        labelText: 'Quantity',
                        labelStyle: context.theme.textTheme.displayMedium
                            ?.copyWith(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: context
                                    .theme.textTheme.displayMedium!.color!)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: color))),
                    // Add validation logic here
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Category',
                      labelStyle: context.theme.textTheme.displayMedium
                          ?.copyWith(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: color),
                      ),
                    ),
                    items: DummyHelper.dummyCategories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      controller.setCategory(newValue!);
                    },
                    // Add validation logic here
                  ),
                  TextFormField(
                    cursorColor: color,
                    controller: controller.locationController,
                    decoration: InputDecoration(
                        labelText: 'Location',
                        labelStyle: context.theme.textTheme.displayMedium
                            ?.copyWith(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: context
                                    .theme.textTheme.displayMedium!.color!)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: color))),
                    // Add validation logic here
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton(
                    child: const Text('Submit',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 100.h,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

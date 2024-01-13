import 'dart:io';

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Center(child: Text('Add Product')),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            SizedBox(
              height: 300.h,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.imagesPath.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
              controller: controller.titleController,
              decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(color: color),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: color))),
              // Add validation logic here
            ),
            TextFormField(
              controller: controller.descriptionController,
              decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(color: color),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: color))),
              // Add validation logic here
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: controller.priceController,
              decoration: InputDecoration(
                  labelText: 'Price',
                  labelStyle: TextStyle(color: color),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: color))),
              // Add validation logic here
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: controller.quantityController,
              decoration: InputDecoration(
                  labelText: 'Quantity',
                  labelStyle: TextStyle(color: color),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: color))),
              // Add validation logic here
            ),
            TextFormField(
              controller: controller.categoryController,
              decoration: InputDecoration(
                  labelText: 'Category',
                  labelStyle: TextStyle(color: color),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: color))),
              // Add validation logic here
            ),
            TextFormField(
              controller: controller.locationController,
              decoration: InputDecoration(
                  labelText: 'Location',
                  labelStyle: TextStyle(color: color),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: color))),
              // Add validation logic here
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
              child: const Text('Submit'),
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
    );
  }
}

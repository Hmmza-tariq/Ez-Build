import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_item_controller.dart';

class AddItemView extends GetView<AddItemController> {
  const AddItemView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            GestureDetector(
              onTap: controller.pickImage,
              child: AbsorbPointer(
                  child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: controller.imagePath.isEmpty
                      ? const Icon(Icons.add_a_photo)
                      : Image.file(
                          File(controller.imagePath),
                          fit: BoxFit.cover,
                        ),
                ),
              )),
            ),
            TextFormField(
              controller: controller.titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              // Add validation logic here
            ),
            TextFormField(
              controller: controller.descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              // Add validation logic here
            ),
            TextFormField(
              controller: controller.priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              // Add validation logic here
            ),
            TextFormField(
              controller: controller.quantityController,
              decoration: const InputDecoration(labelText: 'Quantity'),
              // Add validation logic here
            ),
            TextFormField(
              controller: controller.categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
              // Add validation logic here
            ),
            TextFormField(
              controller: controller.locationController,
              decoration: const InputDecoration(labelText: 'Location'),
              // Add validation logic here
            ),
            CheckboxListTile(
              title: const Text('Is Favorite'),
              value: controller.isFavorite,
              onChanged: (bool? value) {
                // setState(() {
                // controller.isFavorite = value!;
                // });
              },
            ),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                if (controller.formKey.currentState!.validate()) {
                  // If the form is valid, display a Snackbar.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

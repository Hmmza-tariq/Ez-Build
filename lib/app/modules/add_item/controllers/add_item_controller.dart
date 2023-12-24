import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddItemController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _categoryController = TextEditingController();
  final _locationController = TextEditingController();
  final bool _isFavorite = false;

  GlobalKey<FormState> get formKey => _formKey;
  String imagePath = '';
  TextEditingController get titleController => _titleController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get priceController => _priceController;
  TextEditingController get quantityController => _quantityController;
  TextEditingController get categoryController => _categoryController;
  TextEditingController get locationController => _locationController;
  bool get isFavorite => _isFavorite;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagePath = image.path;
    }
  }
}

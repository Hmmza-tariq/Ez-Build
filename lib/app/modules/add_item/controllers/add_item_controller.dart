import 'package:ez_build/app/data/local/my_shared_pref.dart';
import 'package:ez_build/app/data/models/product_model.dart';
import 'package:ez_build/utils/dummy_helper.dart';
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
  List<String> imagesPath = ['', '', '', '', ''];
  int _index = 0;
  int get index => _index;
  List<String> get images => imagesPath;
  TextEditingController get titleController => _titleController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get priceController => _priceController;
  TextEditingController get quantityController => _quantityController;
  TextEditingController get categoryController => _categoryController;
  TextEditingController get locationController => _locationController;
  bool get isFavorite => _isFavorite;

  @override
  void onInit() {
    _locationController.text = MySharedPref.getLocation()!;

    super.onInit();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagesPath[_index] = image.path;
      _index++;
    }
    update(['Image']);
  }

  void addProduct() {
    DummyHelper.dummyProducts.add(ProductModel(
        id: 9,
        images: imagesPath,
        title: titleController.text,
        description: descriptionController.text,
        price: priceController.text as double,
        quantity: quantityController.text,
        category: categoryController.text,
        location: locationController.text,
        isFavorite: false));
  }
}

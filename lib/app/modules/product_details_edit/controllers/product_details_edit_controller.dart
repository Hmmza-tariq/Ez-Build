import 'package:ez_build/utils/dummy_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/models/product_model.dart';

class ProductDetailsEditController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _categoryController = TextEditingController();
  final _locationController = TextEditingController();
  bool _isFavorite = false;
  final _product = Get.arguments as ProductModel;
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
    imagesPath = _product.images;
    _titleController.text = _product.title;
    _descriptionController.text = _product.description;
    _priceController.text = _product.price.toString();
    _quantityController.text = _product.quantity;
    _categoryController.text = _product.category;
    _locationController.text = _product.location;
    _index = _product.images.length;
    _isFavorite = _product.isFavorite;
    super.onInit();
  }

  get product => _product;
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
    DummyHelper.dummyProducts[_product.id] = ProductModel(
        id: _product.id,
        images: imagesPath,
        title: titleController.text,
        description: descriptionController.text,
        price: priceController.text as double,
        quantity: quantityController.text,
        category: categoryController.text,
        location: locationController.text,
        isFavorite: _isFavorite);
  }
}

import 'package:ez_build/utils/dummy_helper.dart';
import 'package:get/get.dart';

import '../../../data/models/product_model.dart';

class MyAdsController extends GetxController {
  // to hold the favorite products
  List<ProductModel> products = [];

  @override
  void onInit() {
    getMyProducts();
    super.onInit();
  }

  getMyProducts() {
    products = DummyHelper.dummyProfile.myProducts;
    update(['MyAds']);
  }
}

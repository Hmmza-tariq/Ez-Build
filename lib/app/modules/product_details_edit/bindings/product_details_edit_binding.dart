import 'package:get/get.dart';

import '../controllers/product_details_edit_controller.dart';

class ProductDetailsEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsEditController>(
      () => ProductDetailsEditController(),
    );
  }
}

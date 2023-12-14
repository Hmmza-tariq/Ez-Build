import 'package:get/get.dart';

// import '../../../../utils/dummy_helper.dart';
import '../../../data/models/product_model.dart';
import '../../base/controllers/base_controller.dart';
import '../../Chat/controllers/chat_controller.dart';

class ProductDetailsController extends GetxController {
  // get product details from arguments
  ProductModel product = Get.arguments;
  int index = 0;
  // for the product size
  var selectedSize = 'M';

  /// when the user press on the favorite button
  onFavoriteButtonPressed() {
    Get.find<BaseController>().onFavoriteButtonPressed(productId: product.id);
    update(['FavoriteButton']);
  }

  /// when the user press on add to Chat button
  onAddToChatPressed() {
    // var mProduct = DummyHelper.products.firstWhere((p) => p.id == product.id);
    // mProduct.quantity = mProduct.quantity! + 1;
    // mProduct.size = selectedSize;
    // Get.find<ChatController>().getChatProducts();
    Get.back();
  }

  /// change the selected size
  changeSelectedSize(String size) {
    if (size == selectedSize) return;
    selectedSize = size;
    update(['Size']);
  }

  void changeImage(int index) {
    this.index = index;
    update(['Index']);
  }
}

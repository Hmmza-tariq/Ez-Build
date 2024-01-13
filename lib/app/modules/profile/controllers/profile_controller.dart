import 'package:ez_build/app/data/models/product_model.dart';
import 'package:ez_build/utils/dummy_helper.dart';
import 'package:ez_build/utils/profile_type.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  late List<ProductModel> myProducts;
  late String name;
  late String phone;
  late String address;
  late ProfileTypes category;

  @override
  void onInit() {
    super.onInit();
    myProducts = DummyHelper.dummyProfile.myProducts;
    name = DummyHelper.dummyProfile.name;
    phone = DummyHelper.dummyProfile.phone;
    address = DummyHelper.dummyProfile.address;
    category = DummyHelper.dummyProfile.category;
  }
}

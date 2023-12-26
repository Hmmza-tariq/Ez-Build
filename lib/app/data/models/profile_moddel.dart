import 'package:ez_build/app/data/models/product_model.dart';
import 'package:ez_build/utils/profile_type.dart';

class ProfileModel {
  List<ProductModel> myProducts;
  String name;
  String phone;
  String address;
  ProfileTypes category;
  ProfileModel(
      {required this.myProducts,
      required this.name,
      required this.phone,
      required this.address,
      required this.category});
}

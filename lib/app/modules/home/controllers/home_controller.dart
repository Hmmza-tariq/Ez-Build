import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/dummy_helper.dart';
import '../../../data/models/product_model.dart';

class HomeController extends GetxController {
  List<ProductModel> products = [];
  List<String> categories = [];
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.brown,
    Colors.grey,
    Colors.indigo,
    Colors.lime,
    Colors.amber,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.limeAccent,
    Colors.pinkAccent,
    Colors.purpleAccent,
    Colors.tealAccent,
    Colors.yellowAccent,
    Colors.blueAccent,
    Colors.cyanAccent,
    Colors.deepOrangeAccent,
    Colors.deepPurpleAccent,
    Colors.greenAccent,
    Colors.indigoAccent,
    Colors.lightBlueAccent,
    Colors.lightGreenAccent,
    Colors.orangeAccent,
    Colors.redAccent,
    Colors.amberAccent,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.black,
  ];
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() {
    products = DummyHelper.dummyProducts;
    categories = DummyHelper.dummyCategories;
  }
}

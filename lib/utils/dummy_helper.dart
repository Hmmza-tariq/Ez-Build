import 'package:ez_build/app/data/models/profile_moddel.dart';
import 'package:ez_build/utils/profile_type.dart';

import '../app/data/models/product_model.dart';
import 'assets.dart';

class DummyHelper {
  const DummyHelper._();

  static List<ProductModel> dummyProducts = [
    ProductModel(
      id: 1,
      images: [
        AssetsManager.product1,
        AssetsManager.product1,
        AssetsManager.product1
      ],
      title: 'Item #1',
      description:
          'This is description. This is description. This is description. This is description. This is description. This is description. This is description. This is description. This is description. ',
      quantity: '100 items',
      price: 250.99,
      category: 'Building',
      location: 'Peshawar rd',
      isFavorite: false,
    ),
    ProductModel(
      id: 2,
      images: [
        AssetsManager.product2,
        AssetsManager.product2,
        AssetsManager.product2
      ],
      title: 'Item #2',
      description:
          'This is description. This is description. This is description. This is description. This is description. This is description. This is description. This is description. This is description. ',
      quantity: '400 items',
      price: 20.99,
      category: 'Decoration',
      location: 'H12',
      isFavorite: false,
    ),
    ProductModel(
      id: 3,
      images: [
        AssetsManager.product3,
        AssetsManager.product3,
        AssetsManager.product3
      ],
      title: 'Item #3',
      description:
          'This is description. This is description. This is description. This is description. This is description. This is description. This is description. This is description. This is description. ',
      quantity: '30 items',
      price: 40.99,
      category: 'Clothes',
      location: 'F11',
      isFavorite: false,
    ),
    ProductModel(
      id: 4,
      images: [
        AssetsManager.product4,
        AssetsManager.product4,
        AssetsManager.product4
      ],
      title: 'Item #4',
      description:
          'This is description. This is description. This is description. This is description. This is description. This is description. This is description. This is description. This is description. ',
      quantity: '100 items',
      price: 250.99,
      category: 'Building',
      location: 'Blue Area',
      isFavorite: false,
    ),
    ProductModel(
      id: 5,
      images: [
        AssetsManager.product5,
        AssetsManager.product5,
        AssetsManager.product5
      ],
      title: 'Item #5',
      description:
          'This is description. This is description. This is description. This is description. This is description. This is description. This is description. This is description. This is description. ',
      quantity: '400 items',
      price: 20.99,
      category: 'Decoration',
      location: 'E11',
      isFavorite: false,
    ),
    ProductModel(
      id: 6,
      images: [
        AssetsManager.product6,
        AssetsManager.product6,
        AssetsManager.product6
      ],
      title: 'Item #6',
      description:
          'This is description. This is description. This is description. This is description. This is description. This is description. This is description. This is description. This is description. ',
      quantity: '30 items',
      price: 40.99,
      category: 'Clothes',
      location: 'g11',
      isFavorite: false,
    ),
  ];

  static ProfileModel dummyProfile = ProfileModel(
      myProducts: dummyProducts.where((product) => product.id.isEven).toList(),
      name: 'John Doe',
      phone: '03001234567',
      address: 'Peshawar Road, Rawalpindi',
      category: ProfileTypes.seller);
}

import 'package:ez_build/app/data/models/profile_moddel.dart';
import 'package:ez_build/app/data/models/users.dart';
import 'package:ez_build/utils/profile_type.dart';

import '../app/data/models/product_model.dart';
import 'assets_manager.dart';

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
      category: dummyCategories[0],
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
      category: dummyCategories[1],
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
      category: dummyCategories[2],
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
      category: dummyCategories[3],
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
      category: dummyCategories[4],
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
      category: dummyCategories[5],
      location: 'g11',
      isFavorite: false,
    ),
  ];

  static List<String> dummyCategories = [
    'Electronics',
    'Clothes',
    'Furniture',
    'Books',
    'Sports',
    'Others'
  ];

  static ProfileModel dummyProfile = ProfileModel(
      myProducts: dummyProducts.where((product) => product.id.isEven).toList(),
      name: 'John Doe',
      phone: '03001234567',
      address: 'Peshawar Road, Rawalpindi',
      category: ProfileTypes.seller);

  static List<ChatUser> dummyUsers = [
    ChatUser(
        name: 'User 1',
        image: AssetsManager.userIcon,
        id: '1',
        about: 'User 1',
        createdAt: '01-01-2021',
        email: 'user1@gmail.com',
        isOnline: false,
        lastActive: 'yesterday',
        pushToken: '111'),
    ChatUser(
        name: 'User 2',
        image: AssetsManager.userIcon,
        id: '2',
        about: 'User 2',
        createdAt: '01-01-2021',
        email: 'user2@gmail.com',
        isOnline: false,
        lastActive: 'yesterday',
        pushToken: '222'),
    ChatUser(
        name: 'User 3',
        image: AssetsManager.userIcon,
        id: '3',
        about: 'User 3',
        createdAt: '01-01-2021',
        email: 'user3@gmail.com',
        isOnline: false,
        lastActive: 'yesterday',
        pushToken: '333'),
  ];
}

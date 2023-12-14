import '../app/data/models/product_model.dart';
import 'constants.dart';

class DummyHelper {
  const DummyHelper._();

  static List<ProductModel> products = [
    ProductModel(
      id: 1,
      images: [Constants.product1, Constants.product1, Constants.product1],
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
      images: [Constants.product2, Constants.product2, Constants.product2],
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
      images: [Constants.product3, Constants.product3, Constants.product3],
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
      images: [Constants.product4, Constants.product4, Constants.product4],
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
      images: [Constants.product5, Constants.product5, Constants.product5],
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
      images: [Constants.product6, Constants.product6, Constants.product6],
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
}

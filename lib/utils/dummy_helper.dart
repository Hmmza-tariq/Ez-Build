import '../app/data/models/product_model.dart';
import 'constants.dart';

class DummyHelper {
  const DummyHelper._();

  static List<ProductModel> products = [
    ProductModel(
      id: 1,
      images: [Constants.product1, Constants.product1, Constants.product1],
      title: 'Item #1',
      quantity: '100 items',
      price: 250.99,
      category: 'Building',
      location: 'Peshawar rd',
      isFavorite: false,
    ),
  ];
}

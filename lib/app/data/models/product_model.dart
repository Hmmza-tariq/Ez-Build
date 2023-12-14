class ProductModel {
  int id;
  List<String> images;
  String title;
  String description;
  double price;
  String quantity;
  String category;
  String location;
  bool isFavorite;
  ProductModel(
      {required this.id,
      required this.images,
      required this.title,
      required this.description,
      required this.price,
      required this.quantity,
      required this.category,
      required this.location,
      required this.isFavorite});
}

class ProductModel {
  int? id;
  List<String>? images;
  String? title;
  double? price;
  String? quantity;
  String? category;
  String? location;
  bool? isFavorite;
  ProductModel(
      {this.id,
      this.images,
      this.title,
      this.price,
      this.quantity,
      this.category,
      this.location,
      this.isFavorite});
}

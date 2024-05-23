// ignore_for_file: file_names

class ProductModel {
  int id, stock;
  double discountPercentage, price, rating;
  final String title, description, brand, category, thumbnail;
  final List<dynamic> images;
  bool favourate = false;
  int itemsInCart = 0;
  String lowerTitle = "";

  ProductModel({
    required this.rating,
    required this.id,
    required this.price,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
    required this.discountPercentage,
    required this.description,
    required this.title,
    required this.favourate,
  });

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = int.parse(json["id"].toString().trim()),
        price = double.parse(json["price"].toString().trim()),
        discountPercentage = double.parse((json["discountPercentage"] ?? 0.0).toString().trim()),
        rating = double.parse(json["rating"].toString().trim()),
        stock = int.parse(json["stock"].toString().trim()),
        title = json["title"] ?? "Others",
        description = json["description"] ?? "",
        brand = json["brand"] ?? "Others",
        category = json["category"] ?? "Others",
        thumbnail = json["thumbnail"],
        images = json["images"];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "price": price,
      "discountPercentage": discountPercentage,
      "rating": rating,
      "stock": stock,
      "title": title,
      "description": description,
      "brand": brand,
      "category": category,
      "thumbnail": thumbnail,
      "images": images,
    };
  }
}

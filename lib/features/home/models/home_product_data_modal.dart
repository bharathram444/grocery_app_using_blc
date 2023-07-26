class ProductDataModel {
  int id;
  String name;
  String discription;
  double price;
  String imageUrl;

  ProductDataModel(
      {required this.id,
      required this.name,
      required this.discription,
      required this.price,
      required this.imageUrl});

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json['id'],
      discription: json['description'],
      imageUrl: json['image'],
      name: json['title'],
      price: json['price'],
    );
  }
}

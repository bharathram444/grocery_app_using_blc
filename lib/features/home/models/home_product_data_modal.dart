class ProductDataModel {
  final int id;
  final String name;
  final String discription;
  final double price;
  final String imageUrl;

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

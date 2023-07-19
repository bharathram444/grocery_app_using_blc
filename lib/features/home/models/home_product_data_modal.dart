class ProductDataModel {
  final String id;
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
      discription: json['id'],
      imageUrl: json['id'],
      name: json['id'],
      price: json['id'],
    );
  }
}

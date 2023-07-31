import 'package:meta/meta.dart';
import 'package:shopping_app_using_blc/features/home/models/product_data_modal_full_details.dart';

class ProductDataModel {
  int id;
  String name;
  String discription;
  double price;
  String imageUrl;
  String category;
  double rating;
  int count;
  int numproducts = 0;

  ProductDataModel(
      {required this.id,
      required this.name,
      required this.discription,
      required this.price,
      required this.imageUrl,
      required this.category,
      required this.rating,
      required this.count,
      required this.numproducts});

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json['id'],
      discription: json['description'],
      imageUrl: json['image'],
      name: json['title'],
      price: json['price'],
      category: json['category'],
      count: json['rating']['count'],
      rating: json['rating']['rate'],
      numproducts: 0,
    );
  } // Conversion constructor to convert ProductDataModelForFullDetails to ProductDataModel
  ProductDataModel.fromProductDataModelForFullDetails(
      ProductDataModelForFullDetails productDataModelForFullDetails)
      : id = productDataModelForFullDetails.id,
        name = productDataModelForFullDetails.name,
        discription = productDataModelForFullDetails.discription,
        price = productDataModelForFullDetails.price,
        imageUrl = productDataModelForFullDetails.imageUrl,
        category = productDataModelForFullDetails.category,
        rating = productDataModelForFullDetails.rating,
        count = productDataModelForFullDetails.count,
        numproducts = productDataModelForFullDetails.numproducts;
}

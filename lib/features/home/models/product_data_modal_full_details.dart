import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';

class ProductDataModelForFullDetails {
  int id;
  String name;
  String discription;
  double price;
  String imageUrl;
  String category;
  double rating;
  int count;
  int numproducts;

  ProductDataModelForFullDetails(
      {required this.id,
      required this.name,
      required this.discription,
      required this.price,
      required this.imageUrl,
      required this.category,
      required this.rating,
      required this.count,
      required this.numproducts});
  // Conversion constructor to convert ProductDataModel to ProductDataModelForFullDetails
  ProductDataModelForFullDetails.fromProductDataModel(
      ProductDataModel productDataModel)
      : id = productDataModel.id,
        name = productDataModel.name,
        discription = productDataModel.discription,
        price = productDataModel.price,
        imageUrl = productDataModel.imageUrl,
        category = productDataModel.category,
        rating = productDataModel.rating,
        count = productDataModel.count,
        numproducts = 0;
}

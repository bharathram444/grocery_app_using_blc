import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app_using_blc/features/home/models/home_product_data_modal.dart';

// // Create a model class to represent the data
// class Post {
//   final int id;
//   final String title;
//   final String body;

//   Post({required this.id, required this.title, required this.body});

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       title: json['title'],
//       body: json['body'],
//     );
//   }
// }

// Function to fetch data from the API
// Future<List<ProductDataModel>> fetchPosts() async {
//   final response =
//       await http.get(Uri.parse('https://fakestoreapi.com/products'));

//   if (response.statusCode == 200) {
//     List<dynamic> data = jsonDecode(response.body);
//     //List<Post> posts = data.map((item) => Post.fromJson(item)).toList();
//     List<ProductDataModel> products =
//         data.map((item) => ProductDataModel.fromJson(item)).toList();
//     //return posts;
//     return products;
//   } else {
//     throw Exception('Failed to load data');
//   }
// }

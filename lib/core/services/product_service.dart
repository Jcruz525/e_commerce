// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:e_commerce/data/models/product_model.dart';
import 'package:http/http.dart' as http;


class ProductService {
  static const String baseUrl = 'https://fakestoreapi.com';


  Future<List<ProductModel>> fetchAllProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
print('Raw API response: ${response.body}');
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }


  Future<ProductModel> fetchProductById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$id'));
print('Raw API response: ${response.body}');
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);
      return ProductModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load product');
    }
  }
}
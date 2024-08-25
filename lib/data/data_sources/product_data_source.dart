import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product_model.dart';

class ProductDataSource {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await rootBundle.loadString('assets/data/products.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }
}

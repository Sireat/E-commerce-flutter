import 'package:flutter/material.dart';
import '../../domain/entities/product_entity.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  ProductCard({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Image.network(product.imageUrl, height: 100, width: 100),
            Text(product.name),
            Text('\$${product.price.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}

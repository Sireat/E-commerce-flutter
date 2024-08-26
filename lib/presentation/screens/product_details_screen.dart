import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/product_entity.dart';
import '../providers/cart_provider.dart';
import '../widgets/custom_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Column(
        children: [
          Image.network(product.imageUrl, height: 200, width: 200),
          Text(product.name, style: TextStyle(fontSize: 24)),
          Text('\$${product.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 20)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(product.description),
          ),
          Spacer(),
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return CustomButton(
                label: 'Add to Cart',
                onPressed: () {
                  cartProvider.addToCart(product);
                  // Show a simple feedback (like a SnackBar)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product.name} added to cart!')),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/product_entity.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.cartItems.isEmpty) {
            return Center(child: Text('No items in the cart'));
          } else {
            return ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Quantity: 1\nPrice: \$${item.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      cartProvider.removeFromCart(item);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}

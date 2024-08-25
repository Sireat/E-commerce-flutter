import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme.dart';
import 'data/data_sources/product_data_source.dart';
import 'data/repositories/product_repository.dart';
import 'domain/use_cases/fetch_products.dart';
import 'presentation/providers/cart_provider.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/cart_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        Provider(
          create: (context) => ProductRepositoryImpl(ProductDataSource()),
        ),
        Provider(
          create: (context) => FetchProducts(
            context.read<ProductRepositoryImpl>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'E-commerce App',
        theme: appTheme,
        home: HomeScreen(),
        routes: {
          '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}

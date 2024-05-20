import 'package:flutter/material.dart';

// import '../models/product.dart';
import '../widgets/product_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  // final List<Product> loadedProducts = ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: ProductGrid(),
    );
  }
}
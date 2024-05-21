import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../providers/products.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final loadedProducts = productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // create: (c) => loadedProducts[i],
        value: loadedProducts[i],
        child: ProductItem(
            // loadedProducts[i].id,
            // loadedProducts[i].title,
            // loadedProducts[i].imageUrl,
            // loadedProducts[i].isFavorite
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}

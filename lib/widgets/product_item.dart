import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/products.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final bool isFavorite;

  // ProductItem(this.id, this.title, this.imageUrl, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<Products>(context, listen: false);
    // Provider.of<Products>(context).addFavorite()

    // final product = Provider.of<Product>(context);

    return Consumer<Product>(
      builder: (ctx, product, child) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Container(
            // decoration: BoxDecoration(
            //   color: Colors.lime,
            //   border: Border.all(width: 1, color: Colors.black87),
            //   borderRadius: BorderRadius.circular(10),
            // ),
            child: GestureDetector(
              onTap: () {
                // On The Fly Route
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (ctx) => ProductDetailScreen(title),
                //   ),
                // );

                Navigator.of(context).pushNamed(
                  ProductDetailScreen.routeName,
                  arguments: product.id,
                );
              },
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(
                product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
              ),
              onPressed: () {
                product.toggleFavoriteStatus();
                // Provider.of<Products>(context, listen: false).addFavorite(id, product.isFavorite);
              },
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}

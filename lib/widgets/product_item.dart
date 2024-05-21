import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/products.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final bool isFavorite;

  ProductItem(this.id, this.title, this.imageUrl, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<Products>(context, listen: false);
    // Provider.of<Products>(context).addFavorite()

    return ClipRRect(
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
                arguments: id,
              );
            },
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border_outlined),
            onPressed: () {
              Provider.of<Products>(context, listen: false).addFavorite(id, isFavorite);
            },
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

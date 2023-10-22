import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/colors.dart';
import '../../../models/Product.dart';
import '../../../providers/product_provider.dart';
import '../screens/product_screen.dart';

class SimilarProductCard extends StatelessWidget {
  const SimilarProductCard({
    super.key,
    required this.context,
    required this.product,
  });

  final BuildContext context;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        List<Product> similarProductList =
            Provider.of<ProductProvider>(context, listen: false).productList;
        similarProductList.shuffle(Random());
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;

              final curve =
                  CurvedAnimation(parent: animation, curve: Curves.ease);
              var tween = Tween(begin: begin, end: end);
              var offsetAnimation = tween.animate(curve);

              return SlideTransition(
                position: offsetAnimation,
                child: ProductScreen(
                  product: product,
                  similarProductList: similarProductList,
                ),
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 100,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  product.images.first,
                  height: 75,
                  width: 75,
                  fit: BoxFit.contain,
                  errorBuilder: (context, child, loadingProgress) {
                    return const SizedBox(
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Text(
                          'Image Not Found',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                Text(
                  '\$${product.price.toString()}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

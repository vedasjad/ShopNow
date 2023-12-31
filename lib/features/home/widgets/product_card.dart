import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/colors.dart';
import '../../../models/Product.dart';
import '../../../providers/product_provider.dart';
import '../../product/screens/product_screen.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.product,
  });

  final double screenHeight;
  final double screenWidth;
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  String newImageUrl = '';
  // void removeBackground(BuildContext context) async {
  //   newImageUrl = await HomeServices().removeBackground(
  //       imageUrl: widget.product.images!.first, context: context);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    // if (widget.product.id == 1) removeBackground(context);
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
                  product: widget.product,
                  similarProductList: similarProductList,
                ),
              );
            },
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Image.network(
                (newImageUrl == '') ? widget.product.images.first : newImageUrl,
                width: MediaQuery.of(context).size.width,
                errorBuilder: (context, child, loadingProgress) {
                  return Container(
                    constraints: const BoxConstraints.expand(),
                    child: const Center(
                      child: Text(
                        'Image Not Found',
                        style: TextStyle(
                          color: AppColors.darkColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    widget.product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '\$${widget.product.price.toString()}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 19,
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: AppColors.darkColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.primaryColor,
                            size: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

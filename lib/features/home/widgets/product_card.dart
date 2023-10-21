import 'package:flutter/material.dart';

import '../../../common/colors.dart';
import '../../../models/Product.dart';
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(product: widget.product),
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
                  return SizedBox(
                    width: widget.screenWidth * 0.2,
                    height: widget.screenHeight * 0.15,
                    child: const Center(
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

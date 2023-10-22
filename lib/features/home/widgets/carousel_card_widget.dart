import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/colors.dart';
import '../../../models/Product.dart';
import '../../../providers/product_provider.dart';
import '../../product/screens/product_screen.dart';

class CarouselCardWidget extends StatefulWidget {
  const CarouselCardWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<CarouselCardWidget> createState() => _CarouselCardWidgetState();
}

class _CarouselCardWidgetState extends State<CarouselCardWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: AppColors.greyColor,
              ),
            ),
            Expanded(
              flex: 3,
              child: Image.network(
                widget.product.images[0],
                alignment: Alignment.centerRight,
                fit: BoxFit.contain,
                height: screenHeight * 0.35,
                // loadingBuilder: (context, child, loadingProgress) {
                //   if (loadingProgress == null) return child;
                //   return Shimmer.fromColors(
                //     baseColor: AppColors.primaryColor,
                //     highlightColor: AppColors.greyColor,
                //     child: Container(
                //       constraints: const BoxConstraints.expand(),
                //       decoration: const BoxDecoration(
                //         color: Colors.transparent,
                //       ),
                //     ),
                //   );
                // },
                errorBuilder: (context, child, loadingProgress) {
                  return Container(
                    constraints: const BoxConstraints.expand(),
                    color: AppColors.primaryColor,
                    child: const Center(
                      child: Text(
                        'Image Not Found',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
          width: screenWidth * 0.35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.darkColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.product.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.darkColor.withOpacity(0.75),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  onTap: () {
                    List<Product> similarProductList =
                        Provider.of<ProductProvider>(context, listen: false)
                            .productList;
                    similarProductList.shuffle(Random());
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;

                          final curve = CurvedAnimation(
                              parent: animation, curve: Curves.ease);
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
                  child: Container(
                    alignment: Alignment.center,
                    color: AppColors.darkColor.withOpacity(0.85),
                    height: 35,
                    width: 100,
                    child: const Text(
                      "Shop Now",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

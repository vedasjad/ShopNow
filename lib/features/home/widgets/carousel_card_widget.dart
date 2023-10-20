import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../models/Product.dart';
import '../../../utils/colors.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(product: widget.product),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.network(
            widget.product.images![0],
            fit: BoxFit.cover,
            width: screenWidth + 10,
            height: screenHeight * 0.35,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Shimmer.fromColors(
                baseColor: AppColors.primaryColor,
                highlightColor: AppColors.greyColor,
                child: Container(
                  constraints: const BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              );
            },
            errorBuilder: (context, child, loadingProgress) {
              return Container(
                constraints: const BoxConstraints.expand(),
                color: AppColors.primaryColor,
                child: Center(
                  child: Text(
                    'Image Not Found',
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      fontSize: 30,
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            },
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            width: screenWidth * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.title!,
                  style: GoogleFonts.getFont(
                    "Ubuntu",
                    color: AppColors.darkColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.product.description!,
                  style: GoogleFonts.getFont(
                    "Ubuntu",
                    color: AppColors.darkColor.withOpacity(0.75),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
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
      ),
    );
  }
}

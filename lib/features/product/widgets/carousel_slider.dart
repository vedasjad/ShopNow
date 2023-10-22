import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/colors.dart';
import '../../../providers/product_provider.dart';
import '../../product/widgets/dots_widget.dart';
import '../screens/product_screen.dart';

class CarouselSlider extends StatelessWidget {
  const CarouselSlider({
    super.key,
    required this.widget,
    required this.screenWidth,
    required this.screenHeight,
  });

  final ProductScreen widget;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          PageView.builder(
            itemCount: widget.product.images.length,
            onPageChanged: (index) {
              Provider.of<ProductProvider>(context, listen: false)
                  .updateActiveIndex(index);
            },
            itemBuilder: (context, index) {
              return Image.network(
                widget.product.images[index],
                width: screenWidth * 0.6,
                height: screenHeight * 0.35,
                errorBuilder: (context, child, loadingProgress) {
                  return SizedBox(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.3,
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
              );
            },
          ),
          DotsWidget(widget: widget),
        ],
      ),
    );
  }
}

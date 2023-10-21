import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/colors.dart';
import '../../../providers/product_provider.dart';
import '../screens/product_screen.dart';

class DotsWidget extends StatelessWidget {
  const DotsWidget({
    super.key,
    required this.widget,
  });

  final ProductScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, bottom: 20),
      height: 100,
      width: 7,
      child: ListView.builder(
        itemCount: widget.product.images.length,
        itemExtent: 20,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            width: 3.5,
            height: 3.5,
            decoration: BoxDecoration(
              color: (Provider.of<ProductProvider>(context, listen: true)
                          .activeIndex ==
                      index)
                  ? AppColors.darkColor
                  : AppColors.darkColor.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    );
  }
}

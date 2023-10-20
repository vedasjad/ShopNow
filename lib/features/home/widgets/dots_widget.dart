import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/carousel_provider.dart';
import '../../../utils/colors.dart';

class DotsWidget extends StatelessWidget {
  const DotsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, bottom: 20),
      height: 7,
      width: 100,
      child: ListView.builder(
        itemCount: 4,
        itemExtent: 20,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 3.5,
            height: 3.5,
            decoration: BoxDecoration(
              color: (Provider.of<CarouselProvider>(context, listen: true)
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

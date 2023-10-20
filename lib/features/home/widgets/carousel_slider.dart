import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/carousel_provider.dart';
import '../screens/home_screen.dart';
import 'carousel_card_widget.dart';
import 'dots_widget.dart';

class CarouselSlider extends StatelessWidget {
  const CarouselSlider({
    super.key,
    required this.screenHeight,
    required PageController pageController,
  }) : _pageController = pageController;

  final double screenHeight;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
      ),
      child: SizedBox(
        height: screenHeight * 0.27,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            PageView.builder(
              itemCount: productList.length,
              allowImplicitScrolling: true,
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index) {
                Provider.of<CarouselProvider>(context, listen: false)
                    .updateActiveIndex(index);
              },
              itemBuilder: (BuildContext context, index) {
                return CarouselCardWidget(
                  product: productList[index],
                );
              },
            ),
            const DotsWidget(),
          ],
        ),
      ),
    );
  }
}

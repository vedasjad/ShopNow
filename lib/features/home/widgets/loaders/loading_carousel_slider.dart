import 'package:flutter/material.dart';

import '../../../../common/colors.dart';

class LoadingCarouselSlider extends StatelessWidget {
  const LoadingCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
              itemCount: 4,
              itemBuilder: (BuildContext context, index) {
                return Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: AppColors.greyColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(15, 30, 15, 15),
                              height: 15,
                              width: 100,
                              color: AppColors.darkColor.withOpacity(0.3),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                              height: 15,
                              width: 80,
                              color: AppColors.darkColor.withOpacity(0.3),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                              height: 15,
                              width: 120,
                              color: AppColors.darkColor.withOpacity(0.3),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: AppColors.darkColor.withOpacity(0.3),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

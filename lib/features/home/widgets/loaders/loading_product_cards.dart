import 'package:flutter/material.dart';

import '../../../../common/colors.dart';

class LoadingProductCards extends StatelessWidget {
  const LoadingProductCards({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.33 * 4,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(
              parent: NeverScrollableScrollPhysics()),
          padding: const EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2 / 3,
            crossAxisCount: 2,
            mainAxisExtent: screenHeight * 0.32,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      constraints: const BoxConstraints.expand(),
                      color: AppColors.darkColor.withOpacity(0.3),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    height: 15,
                    width: 100,
                    color: AppColors.darkColor.withOpacity(0.3),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    height: 15,
                    width: 100,
                    color: AppColors.darkColor.withOpacity(0.3),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                    height: 15,
                    width: 100,
                    color: AppColors.darkColor.withOpacity(0.3),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

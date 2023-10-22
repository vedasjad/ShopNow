import 'package:flutter/material.dart';

import '../../../../common/colors.dart';

class LoadingCategoryList extends StatelessWidget {
  const LoadingCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            height: 25,
            width: 80,
            margin: (index == 0)
                ? const EdgeInsets.only(left: 15, right: 5)
                : const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(15),
            ),
          );
        },
      ),
    );
  }
}

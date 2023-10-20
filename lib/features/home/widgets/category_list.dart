import 'package:flutter/material.dart';

import '../../../models/category.dart';
import '../../../utils/colors.dart';
import '../screens/home_screen.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.selectedCategory,
  });

  final Category selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            margin: (index == 0)
                ? const EdgeInsets.only(left: 15, right: 5)
                : const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            decoration: BoxDecoration(
              color: (selectedCategory == categoryList[index])
                  ? AppColors.darkColor
                  : AppColors.greyColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              categoryList[index].name!,
              style: TextStyle(
                color: (selectedCategory == categoryList[index])
                    ? AppColors.primaryColor
                    : AppColors.darkColor.withOpacity(0.7),
              ),
            ),
          );
        },
      ),
    );
  }
}

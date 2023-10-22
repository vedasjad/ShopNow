import 'package:ecommerceapptask/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/colors.dart';
import '../../../providers/category_provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: Provider.of<CategoryProvider>(context).categoryList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Provider.of<CategoryProvider>(context, listen: false)
                  .updateSelectedCategory(
                Provider.of<CategoryProvider>(context, listen: false)
                    .categoryList[index],
                Provider.of<ProductProvider>(context, listen: false)
                    .productList,
              );
            },
            child: Container(
              alignment: Alignment.center,
              margin: (index == 0)
                  ? const EdgeInsets.only(left: 15, right: 5)
                  : const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              decoration: BoxDecoration(
                color: (Provider.of<CategoryProvider>(context, listen: true)
                            .selectedCategory ==
                        Provider.of<CategoryProvider>(context)
                            .categoryList[index])
                    ? AppColors.darkColor
                    : AppColors.greyColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                Provider.of<CategoryProvider>(context).categoryList[index],
                style: TextStyle(
                  color: (Provider.of<CategoryProvider>(context, listen: true)
                              .selectedCategory ==
                          Provider.of<CategoryProvider>(context)
                              .categoryList[index])
                      ? AppColors.primaryColor
                      : AppColors.darkColor.withOpacity(0.7),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

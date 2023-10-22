import 'package:ecommerceapptask/common/colors.dart';
import 'package:ecommerceapptask/providers/favourites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/favourite_product_card.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Your Favourites",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SizedBox(
          height: screenHeight *
              0.33 *
              (Provider.of<FavouritesProvider>(context).favouritesList.length /
                      2 +
                  1),
          child: GridView.builder(
            padding: const EdgeInsets.all(15),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2 / 3,
              crossAxisCount: 2,
              mainAxisExtent: screenHeight * 0.32,
            ),
            itemCount:
                Provider.of<FavouritesProvider>(context).favouritesList.length,
            itemBuilder: (context, index) {
              return FavouriteProductCard(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                product: Provider.of<FavouritesProvider>(context)
                    .favouritesList[index],
              );
            },
          ),
        ),
      ),
    );
  }
}

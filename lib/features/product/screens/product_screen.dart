import 'dart:math';

import 'package:ecommerceapptask/providers/favourites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/colors.dart';
import '../../../models/Product.dart';
import '../../product/widgets/carousel_slider.dart';
import '../widgets/buy_now_button.dart';
import '../widgets/similar_product_card.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen(
      {super.key, required this.product, required this.similarProductList});

  final Product product;
  final List<Product> similarProductList;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Provider.of<FavouritesProvider>(context, listen: false)
                      .favouritesList
                      .contains(widget.product)
                  ? Provider.of<FavouritesProvider>(context, listen: false)
                      .removeFavourite(widget.product)
                  : Provider.of<FavouritesProvider>(context, listen: false)
                      .addFavourite(widget.product);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(
                Provider.of<FavouritesProvider>(context)
                        .favouritesList
                        .contains(widget.product)
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                color: AppColors.darkColor,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          height: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                  widget: widget,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.product.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: AppColors.darkColor,
                                ),
                              ),
                              Text(
                                '\$${widget.product.price.toString()}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              widget.product.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Text(
                            "Similar Products",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: AppColors.darkColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: min(6, widget.similarProductList.length),
                        itemBuilder: (context, index) {
                          return SimilarProductCard(
                            context: context,
                            product: widget.similarProductList[index],
                          );
                        },
                      ),
                    ),
                    const BuyNowButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

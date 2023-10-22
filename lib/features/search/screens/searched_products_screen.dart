import 'package:ecommerceapptask/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/Product.dart';
import '../../../providers/product_provider.dart';
import '../../home/widgets/product_card.dart';

class SearchedProductsScreen extends StatefulWidget {
  const SearchedProductsScreen(
      {super.key, required this.filteredProducts, required this.searchedText});

  final List<Product> filteredProducts;
  final String searchedText;

  @override
  State<SearchedProductsScreen> createState() => _SearchedProductsScreenState();
}

class _SearchedProductsScreenState extends State<SearchedProductsScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _searchTextController.text = widget.searchedText;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: AppColors.primaryColor,
        title: Container(
          height: 70,
          padding: const EdgeInsets.fromLTRB(0, 15, 10, 15),
          child: SearchBar(
            controller: _searchTextController,
            onSubmitted: (searchText) {
              List<Product> filteredProducts =
                  Provider.of<ProductProvider>(context, listen: false)
                      .productList
                      .where((Product product) => product.title
                          .toLowerCase()
                          .contains(_searchTextController.text.toLowerCase()))
                      .toList();
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;

                    final curve =
                        CurvedAnimation(parent: animation, curve: Curves.ease);
                    var tween = Tween(begin: begin, end: end);
                    var offsetAnimation = tween.animate(curve);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: SearchedProductsScreen(
                        filteredProducts: filteredProducts,
                        searchedText: _searchTextController.text,
                      ),
                    );
                  },
                ),
              );
            },
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            elevation: const MaterialStatePropertyAll(0),
            backgroundColor:
                const MaterialStatePropertyAll(AppColors.greyColor),
            leading: Icon(
              Icons.search_rounded,
              size: 30,
              color: AppColors.darkColor.withOpacity(0.6),
            ),
            trailing: [
              GestureDetector(
                onTap: () => _searchTextController.clear(),
                child: Icon(
                  Icons.clear,
                  size: 25,
                  color: AppColors.darkColor.withOpacity(0.6),
                ),
              )
            ],
            hintText: "Search for brand",
            hintStyle: const MaterialStatePropertyAll(
              TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: screenHeight * 0.33 * (widget.filteredProducts.length / 2 + 1),
        child: GridView.builder(
          padding: const EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2 / 3,
            crossAxisCount: 2,
            mainAxisExtent: screenHeight * 0.32,
          ),
          itemCount: widget.filteredProducts.length,
          itemBuilder: (context, index) {
            return ProductCard(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              product: widget.filteredProducts[index],
            );
          },
        ),
      ),
    );
  }
}

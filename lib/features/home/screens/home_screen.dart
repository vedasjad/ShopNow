import 'dart:async';

import 'package:ecommerceapptask/features/favourites/screens/favourites_screen.dart';
import 'package:ecommerceapptask/features/home/services/home_services.dart';
import 'package:ecommerceapptask/features/search/screens/searched_products_screen.dart';
import 'package:ecommerceapptask/providers/carousel_provider.dart';
import 'package:ecommerceapptask/providers/category_provider.dart';
import 'package:ecommerceapptask/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/colors.dart';
import '../../../models/Product.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/category_list.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  Timer? autoPlayTimer;

  final TextEditingController _searchTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    await HomeServices().fetchProduct(context: context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    autoPlayTimer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (Provider.of<CarouselProvider>(context, listen: false).activeIndex <
          3) {
        Provider.of<CarouselProvider>(context, listen: false).updateActiveIndex(
            Provider.of<CarouselProvider>(context, listen: false).activeIndex +
                1);
      } else {
        Provider.of<CarouselProvider>(context, listen: false)
            .updateActiveIndex(0);
      }
      _pageController.animateToPage(
        Provider.of<CarouselProvider>(context, listen: false).activeIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
      timer.cancel();
    });
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    _pageController.dispose();
    autoPlayTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello,",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "Ved Asjad",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            child: const Icon(
              Icons.notifications,
              color: AppColors.darkColor,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;

                      final curve = CurvedAnimation(
                          parent: animation, curve: Curves.ease);
                      var tween = Tween(begin: begin, end: end);
                      var offsetAnimation = tween.animate(curve);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: const FavouritesScreen(),
                      );
                    },
                  ),
                );
              },
              child: const Icon(
                Icons.favorite_border_rounded,
                color: AppColors.darkColor,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              child: const Icon(
                Icons.menu,
                color: AppColors.darkColor,
                size: 30,
              ),
            ),
          ),
        ],
        leading: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
                "https://thumbs.dreamstime.com/b/smiling-young-indian-man-5913016.jpg"),
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 60,
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: SearchBar(
                controller: _searchTextController,
                onSubmitted: (searchText) {
                  List<Product> filteredProducts = Provider.of<ProductProvider>(
                          context,
                          listen: false)
                      .productList
                      .where((Product product) => product.title
                          .toLowerCase()
                          .contains(_searchTextController.text.toLowerCase()))
                      .toList();
                  final String searchText = _searchTextController.text;
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        final curve = CurvedAnimation(
                            parent: animation, curve: Curves.ease);
                        var tween = Tween(begin: begin, end: end);
                        var offsetAnimation = tween.animate(curve);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: SearchedProductsScreen(
                            filteredProducts: filteredProducts,
                            searchedText: searchText,
                          ),
                        );
                      },
                    ),
                  );
                  _searchTextController.clear();
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
                hintText: "Search for brand",
                hintStyle: const MaterialStatePropertyAll(
                  TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            CarouselSlider(
              screenHeight: screenHeight,
              pageController: _pageController,
            ),
            const CategoryList(),
            const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 20, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "New Arrival",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: (Provider.of<CategoryProvider>(context, listen: true)
                          .selectedCategory ==
                      "All Product")
                  ? screenHeight *
                      0.33 *
                      (Provider.of<ProductProvider>(context)
                                  .productList
                                  .length /
                              2 +
                          1)
                  : screenHeight *
                      0.33 *
                      (Provider.of<CategoryProvider>(context)
                                  .selectedCategoryProductsList
                                  .length /
                              2 +
                          1),
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
                itemCount: (Provider.of<CategoryProvider>(context, listen: true)
                            .selectedCategory ==
                        "All Product")
                    ? Provider.of<ProductProvider>(context).productList.length
                    : Provider.of<CategoryProvider>(context)
                        .selectedCategoryProductsList
                        .length,
                itemBuilder: (context, index) {
                  return (Provider.of<CategoryProvider>(context, listen: true)
                              .selectedCategory ==
                          "All Product")
                      ? ProductCard(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          product: Provider.of<ProductProvider>(context)
                              .productList[index],
                        )
                      : ProductCard(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          product: Provider.of<CategoryProvider>(context)
                              .selectedCategoryProductsList[index],
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

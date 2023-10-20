import 'dart:async';

import 'package:ecommerceapptask/models/category.dart';
import 'package:ecommerceapptask/providers/carousel_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/Product.dart';
import '../../../utils/colors.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/category_list.dart';

List<Category> categoryList = [
  Category(
    id: 1,
    name: "All Product",
    image: "",
  ),
  Category(
    id: 2,
    name: "Smartphone",
    image: "",
  ),
  Category(
    id: 3,
    name: "Wearable",
    image: "",
  ),
  Category(
    id: 4,
    name: "Camera",
    image: "",
  ),
];

List<Product> productList = [
  Product(
    id: 1,
    title: "Handmade Fresh Table",
    price: 687,
    description: "Andy shoes are designed to keeping in...",
    category: Category(
      id: 5,
      name: "Others",
      image: "https://placeimg.com/640/480/any?r=0.591926261873231",
    ),
    images: [
      "https://i.pinimg.com/originals/dc/c7/cf/dcc7cff9631062828450f738e1aaa744.jpg",
      "https://placeimg.com/640/480/any?r=0.9300320592588625",
      "https://placeimg.com/640/480/any?r=0.8807778235430017"
    ],
  ),
  Product(
    id: 1,
    title: "Handmade Fresh Table",
    price: 687,
    description: "Andy shoes are designed to keeping in...",
    category: Category(
      id: 5,
      name: "Others",
      image: "https://placeimg.com/640/480/any?r=0.591926261873231",
    ),
    images: [
      "https://i.pinimg.com/originals/dc/c7/cf/dcc7cff9631062828450f738e1aaa744.jpg",
      "https://placeimg.com/640/480/any?r=0.9300320592588625",
      "https://placeimg.com/640/480/any?r=0.8807778235430017"
    ],
  ),
  Product(
    id: 1,
    title: "Handmade Fresh Table",
    price: 687,
    description: "Andy shoes are designed to keeping in...",
    category: Category(
      id: 5,
      name: "Others",
      image: "https://placeimg.com/640/480/any?r=0.591926261873231",
    ),
    images: [
      "https://i.pinimg.com/originals/dc/c7/cf/dcc7cff9631062828450f738e1aaa744.jpg",
      "https://placeimg.com/640/480/any?r=0.9300320592588625",
      "https://placeimg.com/640/480/any?r=0.8807778235430017"
    ],
  ),
  Product(
    id: 1,
    title: "Handmade Fresh Table",
    price: 687,
    description: "Andy shoes are designed to keeping in...",
    category: Category(
      id: 5,
      name: "Others",
      image: "https://placeimg.com/640/480/any?r=0.591926261873231",
    ),
    images: [
      "https://i.pinimg.com/originals/dc/c7/cf/dcc7cff9631062828450f738e1aaa744.jpg",
      "https://placeimg.com/640/480/any?r=0.9300320592588625",
      "https://placeimg.com/640/480/any?r=0.8807778235430017"
    ],
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  Category selectedCategory = categoryList[0];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
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
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
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
            CategoryList(
              selectedCategory: selectedCategory,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "New Arrival",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkColor,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      "See All",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: AppColors.darkColor.withOpacity(0.7)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.32 * (productList.length / 2 + 1),
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
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      height: screenHeight * 0.25,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  constraints: const BoxConstraints.expand(),
                                  decoration: const BoxDecoration(
                                    color: AppColors.darkColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  constraints: const BoxConstraints.expand(),
                                  decoration: const BoxDecoration(
                                    color: AppColors.greyColor,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      productList[index].images!.first,
                                      width: screenWidth * 0.2,
                                      height: screenHeight * 0.15,
                                    ),
                                  ],
                                ),
                                Text(
                                  productList[index].title!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  productList[index].description!,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${productList[index].price!.toString()}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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

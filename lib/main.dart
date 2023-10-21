import 'package:ecommerceapptask/providers/carousel_provider.dart';
import 'package:ecommerceapptask/providers/category_provider.dart';
import 'package:ecommerceapptask/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/colors.dart';
import 'features/home/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CarouselProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
      ],
      child: MaterialApp(
        title: 'ShopNow',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

import 'package:ecommerceapptask/providers/carousel_provider.dart';
import 'package:ecommerceapptask/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CarouselProvider()),
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

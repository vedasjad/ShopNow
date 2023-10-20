import 'package:ecommerceapptask/utils/colors.dart';
import 'package:flutter/material.dart';

import 'features/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopNow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

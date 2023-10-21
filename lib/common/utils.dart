import 'package:flutter/material.dart';

import 'colors.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.darkColor,
      content: Text(
        text,
        style: const TextStyle(
          color: AppColors.primaryColor,
        ),
      ),
    ),
  );
}

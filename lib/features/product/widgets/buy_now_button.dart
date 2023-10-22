import 'package:flutter/material.dart';

import '../../../common/colors.dart';

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(20),
                backgroundColor:
                    const MaterialStatePropertyAll(AppColors.darkColor),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: const Text(
                "Buy Now",
                style: TextStyle(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

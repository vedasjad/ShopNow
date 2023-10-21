import 'dart:convert';

import 'package:ecommerceapptask/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../common/error_handling.dart';
import '../../../common/utils.dart';
import '../../../models/Product.dart';
import '../../../providers/category_provider.dart';

class HomeServices {
  Future<void> fetchProduct({
    required BuildContext context,
  }) async {
    const String url = 'https://api.escuelajs.co/api/v1/products';
    try {
      http.Response res = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            Provider.of<ProductProvider>(context, listen: false).addProduct(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
            Provider.of<CategoryProvider>(context, listen: false).addCategory(
                Provider.of<ProductProvider>(context, listen: false)
                    .productList[i]
                    .category);
          }
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  // Future<String> removeBackground({
  //   required String imageUrl,
  //   required BuildContext context,
  // }) async {
  //   const String url = 'https://background-removal.p.rapidapi.com/remove';
  //   try {
  //     http.Response res = await http.post(
  //       Uri.parse(url),
  //       headers: <String, String>{
  //         'content-type': 'application/x-www-form-urlencoded',
  //         'X-RapidAPI-Key':
  //             '82ee429c4amsh410b853a33a4b4ap13a034jsn9e298003c6ab',
  //         'X-RapidAPI-Host': 'background-removal.p.rapidapi.com',
  //       },
  //       body: {
  //         'image_url': imageUrl,
  //       },
  //     );
  //     debugPrint(res.body);
  //     httpErrorHandle(response: res, context: context, onSuccess: () {});
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     showSnackBar(context, e.toString());
  //   }
  //   return imageUrl;
  // }
}

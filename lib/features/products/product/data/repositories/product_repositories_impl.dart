import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eco_market/features/products/product/data/model/fruit_model.dart';
import 'package:eco_market/features/products/product/domain/repositories/product_repositories.dart';
import 'package:eco_market/internal/helpers/api_requester.dart';
import 'package:eco_market/internal/helpers/catch_exception.dart';

class ProductRepositoryImpl implements ProductRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<List<AllProductModel>> getAllProduct({
    String? categoryName,
    String? searchText,
  }) async {
    try {
      Response response = await apiRequester.toGet("product-list/", params: {
        'category_name': categoryName,
        'search': searchText,
      });
      log('product-list/ ${categoryName} ${searchText} ===');
      log('getFruits response statusCode == ${response.statusCode}');
      log('getFruits response data == ${response.data}');

      if (response.statusCode == 200) {
        return response.data
            .map<AllProductModel>((value) => AllProductModel.fromJson(value))
            .toList();
      }
      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}

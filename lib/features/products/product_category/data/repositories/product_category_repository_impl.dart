import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eco_market/features/products/product_category/data/models/product_category_model.dart';
import 'package:eco_market/features/products/product_category/domain/repositories/product_category_repository.dart';
import 'package:eco_market/internal/helpers/api_requester.dart';
import 'package:eco_market/internal/helpers/catch_exception.dart';

class ProductCategoryRepositoriImpl implements ProductCategoryRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<List<ProductCategoryModel>> getProductCategory() async {
    try {
      Response response = await apiRequester.toGet("product-category-list");
      log('get product category response data == ${response.data}');
      if (response.statusCode == 200) {
        return response.data
            .map<ProductCategoryModel>(
                (value) => ProductCategoryModel.fromJson(value))
            .toList();
      }
      throw response;
    } catch (e) {
      throw CatchException.convertException(e.toString());
    }
  }
}

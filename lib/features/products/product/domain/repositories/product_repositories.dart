import 'package:eco_market/features/products/product/data/model/fruit_model.dart';

abstract class ProductRepository {
  /// RU: Получение фруктов
  ///
  /// EN: Getting all fruits
  Future<List<AllProductModel>> getAllProduct({
    String? categoryName,
    String? searchText,
  });
}

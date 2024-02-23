
import 'package:eco_market/features/products/product_category/data/models/product_category_model.dart';

abstract class ProductCategoryRepository {
  ///RU: получить список категорий товаров. 
  ///
  ///EN: get a list of product categories.
  Future<List<ProductCategoryModel>> getProductCategory();
}
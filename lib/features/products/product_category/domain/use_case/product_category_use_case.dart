
import 'package:eco_market/features/products/product_category/data/models/product_category_model.dart';
import 'package:eco_market/features/products/product_category/domain/repositories/product_category_repository.dart';

class ProductCategoryUseCase {
  final ProductCategoryRepository productCategoryRepository;

  ProductCategoryUseCase({required this.productCategoryRepository});

  Future<List<ProductCategoryModel>> getProductCategory() async {
    return await productCategoryRepository.getProductCategory();
  }
}

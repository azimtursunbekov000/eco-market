import 'package:eco_market/features/products/product/data/model/fruit_model.dart';
import 'package:eco_market/features/products/product/domain/repositories/product_repositories.dart';

class ProductUseCase {
  final ProductRepository productRepository;

  ProductUseCase({required this.productRepository});

  Future<List<AllProductModel>> getAllProduct({
    String? categoryName,
    String? searchText,
  }) async {
    return await productRepository.getAllProduct(
      categoryName: categoryName,
      searchText: searchText,
    );
  }
}

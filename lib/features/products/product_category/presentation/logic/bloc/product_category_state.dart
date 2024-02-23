part of 'product_category_bloc.dart';

@immutable
sealed class ProductCategoryState {}

final class ProductCategoryInitialState extends ProductCategoryState {}

final class ProductCategoryLoadingState extends ProductCategoryState {}

final class ProductCategoryLoadedState extends ProductCategoryState {
  final List<ProductCategoryModel> productCategoryList;

  ProductCategoryLoadedState({required this.productCategoryList});
}

final class ProductCategoryErrorState extends ProductCategoryState {
  final CatchException error;

  ProductCategoryErrorState({required this.error});
}

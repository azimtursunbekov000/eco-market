part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<AllProductModel> allProductModelList;

  ProductLoadedState({required this.allProductModelList});
}

class ProductErrorState extends ProductState {
  final CatchException error;

  ProductErrorState({required this.error});
}

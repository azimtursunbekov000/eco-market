import 'package:eco_market/features/products/product_category/data/models/product_category_model.dart';
import 'package:eco_market/features/products/product_category/domain/use_case/product_category_use_case.dart';
import 'package:eco_market/internal/helpers/catch_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'product_category_event.dart';
part 'product_category_state.dart';

class ProductCategoryBloc
    extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  final ProductCategoryUseCase productCategoryUseCase;
  ProductCategoryBloc(this.productCategoryUseCase)
      : super(ProductCategoryInitialState()) {
    on<GetProductCategoryEvent>((event, emit) async {
      emit(ProductCategoryLoadingState());

      try {
        // throw 'error';
        final List<ProductCategoryModel> productCategoryList =
            await productCategoryUseCase.getProductCategory();

        emit(ProductCategoryLoadedState(
            productCategoryList: productCategoryList));
      } catch (e) {
        emit(ProductCategoryErrorState(
            error: CatchException.convertException(e.toString())));
      }
    });
  }
}

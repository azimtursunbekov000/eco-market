import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_market/features/products/product/data/model/fruit_model.dart';
import 'package:eco_market/features/products/product/domain/use_cases/poduct_use_case.dart';
import 'package:eco_market/internal/helpers/catch_exception.dart';
import 'package:flutter/material.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUseCase productUseCase;

  ProductBloc(this.productUseCase) : super(ProductInitialState()) {
    on<GetAllProductEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        final List<AllProductModel> allProductModelList =
            await productUseCase.getAllProduct();

        emit(ProductLoadedState(allProductModelList: allProductModelList));
      } catch (e) {
        print('error $e');
        emit(ProductErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}

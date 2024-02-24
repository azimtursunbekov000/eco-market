import 'package:eco_market/features/products/product/data/repositories/product_repositories_impl.dart';
import 'package:eco_market/features/products/product/domain/use_cases/poduct_use_case.dart';
import 'package:eco_market/features/products/product/presentation/logic/bloc/product_bloc.dart';
import 'package:eco_market/features/products/product/presentation/widgets/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonAllProductWidget extends StatefulWidget {
  final String? categoryName;

  const CommonAllProductWidget({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  State<CommonAllProductWidget> createState() => _CommonAllProductWidgetState();
}

class _CommonAllProductWidgetState extends State<CommonAllProductWidget>
    with AutomaticKeepAliveClientMixin {
  late final ProductBloc productBloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    productBloc = ProductBloc(
      ProductUseCase(
        productRepository: ProductRepositoryImpl(),
      ),
    );

    productBloc.add(GetAllProductEvent(categoryName: widget.categoryName));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<ProductBloc, ProductState>(
      bloc: productBloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
        if (state is ProductLoadedState) {
          return Stack(
            children: [
              ListView.separated(
                itemCount: (state.allProductModelList.length / 2).ceil(),
                itemBuilder: (context, index) {
                  int firstIndex = index * 2;
                  int secondIndex = firstIndex + 1;
                  return Row(
                    children: [
                      Expanded(
                        child: ProductBottomSheet(
                          productModel: state.allProductModelList[firstIndex],
                          quantity: 0,
                          incrementQuantity: () {},
                          decrementQuantity: () {},
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: secondIndex < state.allProductModelList.length
                            ? ProductBottomSheet(
                                productModel:
                                    state.allProductModelList[secondIndex],
                                quantity: 0,
                                incrementQuantity: () {},
                                decrementQuantity: () {},
                              )
                            : SizedBox(),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 10),
              ),
              Positioned(
                bottom: 16.0,
                right: 16.0,
                child: FloatingActionButton(
                  onPressed: () {
                    
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}

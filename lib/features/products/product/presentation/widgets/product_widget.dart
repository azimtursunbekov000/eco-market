import 'package:eco_market/features/basket/basket_screen.dart';
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
  int totalItemsInCart = 0;

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
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BasketScreen()),
                );
              },
              child: Stack(
                children: [
                  Icon(Icons.shopping_cart),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '$totalItemsInCart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: ListView.separated(
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
                        incrementQuantity: () {
                          setState(() {
                            totalItemsInCart++; // Увеличиваем сумму товаров при нажатии на кнопку "+"
                          });
                        },
                        decrementQuantity: () {
                          setState(() {
                            totalItemsInCart--;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: secondIndex < state.allProductModelList.length
                          ? ProductBottomSheet(
                              productModel:
                                  state.allProductModelList[secondIndex],
                              quantity: 0,
                              incrementQuantity: () {
                                setState(() {
                                  totalItemsInCart++; 
                                });
                              },
                              decrementQuantity: () {
                                setState(() {
                                  totalItemsInCart--;
                                });
                              },
                            )
                          : SizedBox(),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 10),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}

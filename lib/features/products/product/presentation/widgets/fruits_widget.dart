import 'package:eco_market/features/products/product/data/model/fruit_model.dart';
import 'package:eco_market/features/products/product/data/repositories/product_repositories_impl.dart';
import 'package:eco_market/features/products/product/domain/use_cases/poduct_use_case.dart';
import 'package:eco_market/features/products/product/presentation/logic/bloc/product_bloc.dart';
import 'package:eco_market/features/products/product/presentation/screens/product_screen.dart';
import 'package:eco_market/features/products/product/presentation/widgets/icon_button_widget.dart';
import 'package:eco_market/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonFruitsWidget extends StatefulWidget {
  const CommonFruitsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CommonFruitsWidget> createState() => _CommonFruitsWidgetState();
}

class _CommonFruitsWidgetState extends State<CommonFruitsWidget> {
  final ProductBloc productBloc = ProductBloc(
    ProductUseCase(
      productRepository: ProductRepositoryImpl(),
    ),
  );

  @override
  void initState() {
    productBloc.add(GetAllProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      bloc: productBloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProductLoadedState) {
          return ListView.separated(
            itemCount: (state.allProductModelList.length / 2).ceil(),
            itemBuilder: (context, index) {
              int firstIndex = index * 2;
              int secondIndex = firstIndex + 1;
              return Row(
                children: [
                  Expanded(
                    child: buildProductContainer(
                      state.allProductModelList[firstIndex],
                    ),
                  ),
                  SizedBox(width: 10.w), // Промежуток между контейнерами
                  Expanded(
                    child: secondIndex < state.allProductModelList.length
                        ? buildProductContainer(
                            state.allProductModelList[secondIndex],
                          )
                        : SizedBox(), // В случае, если второго элемента нет
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 10.h),
          );
        }
        return SizedBox();
      },
    );
  }

  Widget buildProductContainer(AllProductModel productModel) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        width: 170.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              spreadRadius: 2,
              color: Colors.black12,
            )
          ],
          color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 5.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 160.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(productModel.image ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                productModel.title ?? '',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "${(productModel.price != null && productModel.price!.contains('.')) ? productModel.price?.split('.')[0] : productModel.price}с",
                style: TextHelpers.price,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButtonWidget(
                    onPressed: () {},
                    icon: Icons.remove,
                  ),
                  Text("1"),
                  IconButtonWidget(
                    onPressed: () {},
                    icon: Icons.add,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

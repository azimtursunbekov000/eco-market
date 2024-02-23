import 'package:eco_market/features/products/product/data/repositories/product_repositories_impl.dart';
import 'package:eco_market/features/products/product/domain/use_cases/poduct_use_case.dart';
import 'package:eco_market/features/products/product/presentation/logic/bloc/product_bloc.dart';
import 'package:eco_market/features/products/product/presentation/widgets/icon_button_widget.dart';
import 'package:eco_market/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:eco_market/features/products/product/data/model/fruit_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  @override
  bool get wantKeepAlive => true;

  late final ProductBloc productBloc;

  @override
  void initState() {
    print('initState');

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
          return Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
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
                  SizedBox(width: 10.w),
                  Expanded(
                    child: secondIndex < state.allProductModelList.length
                        ? buildProductContainer(
                            state.allProductModelList[secondIndex],
                          )
                        : SizedBox(),
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
        showModalBottomSheet(
          showDragHandle: true,
          isScrollControlled: true,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.9,
          ),
          context: context,
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.symmetric(
                // vertical: 10.h,
                horizontal: 15.w,
              ),
              child: Column(
                children: [
                  Flexible(
                    child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              height: 208,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                image: DecorationImage(
                                  image: NetworkImage(productModel.image ?? ''),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              productModel.title ?? '',
                              style: TextHelpers.titleS24W700,
                            ),
                            Text(
                              "${(productModel.price != null && productModel.price!.contains('.')) ? productModel.price?.split('.')[0] : productModel.price}с",
                              style: TextHelpers.price,
                            ),
                            Text(
                              productModel.description ?? '',
                              style: TextHelpers.description,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // -------
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32, top: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(343.w, 54.h),
                        backgroundColor: Color(0xff75DB1B),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Добавить",
                        style: TextHelpers.nameProductCategory,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
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
                  Text(""),
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

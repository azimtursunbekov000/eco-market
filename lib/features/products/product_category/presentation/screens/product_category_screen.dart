import 'package:eco_market/features/products/product_category/data/repositories/product_category_repository_impl.dart';
import 'package:eco_market/features/products/product_category/domain/use_case/product_category_use_case.dart';
import 'package:eco_market/features/products/product_category/presentation/logic/bloc/product_category_bloc.dart';
import 'package:eco_market/features/products/product_category/presentation/widgets/grid_view_content_widget.dart';
import 'package:eco_market/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ProductCategoryBloc productCategoryBloc = ProductCategoryBloc(
    ProductCategoryUseCase(
      productCategoryRepository: ProductCategoryRepositoriImpl(),
    ),
  );

  @override
  void initState() {
    productCategoryBloc.add(GetProductCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Эко Маркет",
          style: TextHelpers.titleS24W700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: BlocConsumer<ProductCategoryBloc, ProductCategoryState>(
          bloc: productCategoryBloc,
          listener: (context, state) {
            if (state is ProductCategoryErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(""),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ProductCategoryLoadedState) {
              return GridViewContentWidget(state);
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}

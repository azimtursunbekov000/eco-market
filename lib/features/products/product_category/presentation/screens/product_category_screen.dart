import 'package:eco_market/features/products/product_category/data/repositories/product_category_repository_impl.dart';
import 'package:eco_market/features/products/product_category/domain/use_case/product_category_use_case.dart';
import 'package:eco_market/features/products/product_category/presentation/logic/bloc/product_category_bloc.dart';
import 'package:eco_market/features/products/product_category/presentation/widgets/grid_view_content_widget.dart';
import 'package:eco_market/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCategoryBloc(
        ProductCategoryUseCase(
          productCategoryRepository: ProductCategoryRepositoriImpl(),
        ),
      )..add(GetProductCategoryEvent()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Эко Маркет",
            style: TextHelpers.titleS24W700,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: BlocConsumer<ProductCategoryBloc, ProductCategoryState>(
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
                return GridViewContentWidget();
              }
              if (state is ProductCategoryErrorState) {
                return ElevatedButton(
                    onPressed: () {
                      context
                          .read<ProductCategoryBloc>()
                          .add(GetProductCategoryEvent());
                    },
                    child: Text('ERRRRRROR'));
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

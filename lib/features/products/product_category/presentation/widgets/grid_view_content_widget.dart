import 'package:eco_market/features/products/product/presentation/screens/product_screen.dart';
import 'package:eco_market/features/products/product_category/presentation/logic/bloc/product_category_bloc.dart';
import 'package:eco_market/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridViewContentWidget extends StatelessWidget {
  const GridViewContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductCategoryBloc>();
    final productCategoryList =
        (bloc.state as ProductCategoryLoadedState).productCategoryList;

    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: productCategoryList.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductScreen(
                    id: productCategoryList[index].id ?? 0,
                  ),
                ),
              );
            },
            child: Container(
              width: 166,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    productCategoryList[index].image ?? '',
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productCategoryList[index].name ?? '',
                      style: TextHelpers.nameProductCategory,
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}

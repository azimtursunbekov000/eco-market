import 'package:eco_market/features/products/product/presentation/widgets/product_widget.dart';
import 'package:eco_market/features/products/product/presentation/widgets/search_widget.dart';
import 'package:eco_market/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int selectedSegmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> tabTitles = [
      "Все",
      "Фрукты",
      "Сухофрукты",
      "Овощи",
      "Зелень",
      "Чай кофе",
      "Молочные продукты"
    ];

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Продукты",
            style: TextHelpers.nameProduct,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SearchWidget(hintText: 'Быстрый поиск'),
              SizedBox(height: 20.h),
              const TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                tabs: [
                  Tab(text: 'Все'),
                  Tab(text: 'Фрукты'),
                  Tab(text: 'Сухофрукты'),
                  Tab(text: 'Овощи'),
                  Tab(text: 'Зелень'),
                  Tab(text: 'Чай кофе'),
                  Tab(text: 'Молочные продукты'),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    CommonAllProductWidget(categoryName: null),
                    CommonAllProductWidget(categoryName: 'Фрукты'),
                    CommonAllProductWidget(categoryName: 'Сухофрукты'),
                    CommonAllProductWidget(categoryName: "Овощи"),
                    CommonAllProductWidget(categoryName: "Зелень"),
                    CommonAllProductWidget(categoryName: "Чай кофе"),
                    CommonAllProductWidget(categoryName: "Молочные продукты"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

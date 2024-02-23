import 'package:eco_market/features/products/product/presentation/widgets/fruits_widget.dart';
import 'package:eco_market/features/products/product/presentation/widgets/search_widget.dart';
import 'package:eco_market/internal/helpers/text_helper.dart';
import 'package:flutter/cupertino.dart';
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

    return Scaffold(
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
            SearchWidget(hintText: 'Быстрый поиск'),
            SizedBox(height: 20.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Row(
                  children: [
                    CupertinoSegmentedControl<int>(
                      borderColor: Colors.grey,
                      selectedColor: Colors.green,
                      unselectedColor: Colors.white,

                      children: {
                        for (int i = 0; i < tabTitles.length; i++)
                          i: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              tabTitles[i],
                              style: TextStyle(
                                color: selectedSegmentIndex == i
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                      },
                      onValueChanged: (index) {
                        setState(() {
                          selectedSegmentIndex = index!;
                        });
                      },
                      groupValue: selectedSegmentIndex,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: getContentForIndex(selectedSegmentIndex),
            ),
          ],
        ),
      ),
    );
  }

  Widget getContentForIndex(int index) {
    switch (index) {
      case 0:
        return CommonFruitsWidget();

      case 1:
        return CommonFruitsWidget();
      case 2:
        return Center(
          child: Text('Calls Page'),
        );
      case 3:
        return Center(
          child: Text('Settings Page'),
        );
      case 4:
        return Center(
          child: Text('Settings Page'),
        );
      case 5:
        return Center(
          child: Text('Settings Page'),
        );
      case 6:
        return Center(
          child: Text('Settings Page'),
        );
      default:
        return SizedBox();
    }
  }
}

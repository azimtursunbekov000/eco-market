import 'package:eco_market/features/basket/data/model/cart_model.dart';
import 'package:eco_market/features/basket/basket_screen.dart';
import 'package:eco_market/internal/commons/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return ChangeNotifierProvider(
          create: (context) => CartModel(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: BottomNavBarScreen(),
          ),
        );
      },
    );
  }
}

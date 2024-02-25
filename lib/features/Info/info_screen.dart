import 'package:eco_market/internal/commons/common_elevated_btm.dart';
import 'package:eco_market/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: ScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: 275.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage('assets/images/info_image.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.h),
              child: Text(
                'Инфо',
                style: TextHelpers.nameProductCategory,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Эко Маркет',
                  style: TextHelpers.nameProduct,
                ),
                SizedBox(height: 10.h),
                Expanded(
                  flex: -1,
                  child: Text(
                    "Фрукты, овощи, зелень, сухофрукты а так же сделанные из натуральных ЭКО продуктов (варенье, салаты, соления, компоты и т.д.) можете заказать удобно, качественно и по доступной цене. Готовы сотрудничать взаимовыгодно с магазинами. Наши цены как на рынке. Мы заинтересованы в экономии ваших денег и времени. Стоимость доставки 150 сом и ещё добавлен для окраину города. При отказе подтвержденного заказа более 2-х раз Клиент заносится в чёрный список!!",
                    style: TextHelpers.description,
                  ),
                ),
                CommonElevatedBtn(
                  onPressed: () {},
                  imagePath: 'assets/images/phone.png',
                  text: 'Позвонить',
                ),
                SizedBox(height: 10.h),
                CommonElevatedBtn(
                  onPressed: () {},
                  imagePath: 'assets/images/whatsapp.png',
                  text: 'Whatsapp',
                ),
                SizedBox(height: 10.h),
                CommonElevatedBtn(
                  onPressed: () {},
                  imagePath: 'assets/images/instagram.png',
                  text: 'Instagram',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

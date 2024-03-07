import 'package:eco_market/features/products/product/data/model/fruit_model.dart';
import 'package:eco_market/features/products/product/presentation/widgets/icon_button_widget.dart';
import 'package:eco_market/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllProduct extends StatefulWidget {
  final AllProductModel productModel;
  final int quantity;
  final VoidCallback incrementQuantity;
  final VoidCallback decrementQuantity;

  const AllProduct({
    Key? key,
    required this.productModel,
    required this.quantity,
    required this.incrementQuantity,
    required this.decrementQuantity,
  }) : super(key: key);

  @override
  _AllProductState createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  int quantity = 0;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                                  image: NetworkImage(
                                      widget.productModel.image ?? ''),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              widget.productModel.title ?? '',
                              style: TextHelpers.titleS24W700,
                            ),
                            Text(
                              "${(widget.productModel.price != null && widget.productModel.price!.contains('.')) ? widget.productModel.price?.split('.')[0] : widget.productModel.price}с",
                              style: TextHelpers.price,
                            ),
                            Text(
                              widget.productModel.description ?? '',
                              style: TextHelpers.description,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32, top: 20),
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(343.w, 54.h),
                            backgroundColor: Color(0xff75DB1B),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Добавить $quantity шт ",
                            style: TextHelpers.nameProductCategory,
                          ),
                        ),
                      ],
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
          boxShadow: const [
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
                    image: NetworkImage(widget.productModel.image ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                widget.productModel.title ?? '',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "${(widget.productModel.price != null && widget.productModel.price!.contains('.')) ? widget.productModel.price?.split('.')[0] : widget.productModel.price}с",
                style: TextHelpers.price,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButtonWidget(
                    onPressed: () {
                      decrementQuantity();
                    },
                    icon: Icons.remove,
                  ),
                  Text(
                    quantity.toString(),
                  ),
                  IconButtonWidget(
                    onPressed: () {
                      incrementQuantity();
                    },
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

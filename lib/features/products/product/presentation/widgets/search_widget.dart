import 'package:eco_market/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  final String hintText;
  const SearchWidget({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF2F2F2),
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xffD2D1D5),
        ),
        hintText: hintText,
        hintStyle: TextHelpers.hintText,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 15.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

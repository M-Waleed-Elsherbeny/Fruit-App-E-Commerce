import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/styles/colors/app_colors_manager.dart';
import 'package:fruit_app/core/styles/fonts/app_text_style.dart';
import 'package:fruit_app/core/utils/spacer.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({
    super.key,
    required this.image,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.price, required this.icon,
  });

  final String image, name, rating, reviews, price;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColorsManager.kScaffoldColor,
      margin: EdgeInsets.only(right: 15.w, bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColorsManager.kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0.r),
                    topRight: Radius.circular(8.0.r),
                  ),
                ),
                child: Image.asset(
                  image,
                  width: 150.w,
                  height: 120.h,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 5.w,
                child: icon
              ),
            ],
          ),
          heightSpace(8),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyle.font16BlackW600,
                ),
                heightSpace(4),
                Text(
                  "⭐ $rating ($reviews)",
                  style: AppTextStyle.font12GreyW600,
                ),
                heightSpace(4),
                Text(
                  "\$ $price",
                  style: AppTextStyle.font16BlackW600,
                ),
                heightSpace(10),
              ],
            ),
          )
        ],
      ),
    );
  }
}

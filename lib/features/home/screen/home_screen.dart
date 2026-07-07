import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/core/styles/assets/app_assets.dart';
import 'package:fruit_app/core/styles/colors/app_colors_manager.dart';
import 'package:fruit_app/core/styles/fonts/app_text_style.dart';
import 'package:fruit_app/core/utils/spacer.dart';
import 'package:fruit_app/features/home/models/banner_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(AppAssets.motor),
            widthSpace(10),
            Text("61 Hopper street..", style: AppTextStyle.font16BlackW500),
            widthSpace(10),
            const Icon(Icons.keyboard_arrow_down),
            const Spacer(),
            SvgPicture.asset(AppAssets.cart),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: bannerImages.length,
              options: CarouselOptions(
                height: 222.h,
                autoPlay: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
              ),
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      SizedBox(child: Image.asset(bannerImages[itemIndex])),
            ),
            Row(
              children: [
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColorsManager.primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

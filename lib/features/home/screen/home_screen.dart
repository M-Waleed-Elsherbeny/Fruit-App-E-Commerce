import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/core/styles/assets/app_assets.dart';
import 'package:fruit_app/core/styles/colors/app_colors_manager.dart';
import 'package:fruit_app/core/styles/fonts/app_text_style.dart';
import 'package:fruit_app/core/utils/spacer.dart';
import 'package:fruit_app/features/home/models/card_item_model.dart';
import 'package:fruit_app/features/home/models/category_model.dart';
import 'package:fruit_app/features/home/widgets/product_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> bannerImages = [
    AppAssets.banner1,
    AppAssets.banner2,
    AppAssets.banner3,
  ];

  List<CategoryModel> categories = [
    CategoryModel(name: "Fruits", image: AppAssets.fruits),
    CategoryModel(name: "Milk & Egg", image: AppAssets.milkEgg),
    CategoryModel(name: "Beverages", image: AppAssets.beverages),
    CategoryModel(name: "Laundry", image: AppAssets.laundry),
    CategoryModel(name: "Vegetables", image: AppAssets.vegetables),
  ];

  List<CardItemModel> productItems = [
    CardItemModel(
      name: "Banana",
      rating: "4.5",
      reviews: "(200)",
      price: "10.00",
      image: AppAssets.banana,
    ),
    CardItemModel(
      name: "Orange",
      rating: "4.2",
      reviews: "(100)",
      price: "12.00",
      image: AppAssets.orange,
    ),
    CardItemModel(
      name: "Arial",
      rating: "3.8",
      reviews: "(50)",
      price: "5.00",
      image: AppAssets.arial,
    ),
    CardItemModel(
      name: "Pepper",
      rating: "4.0",
      reviews: "(80)",
      price: "8.00",
      image: AppAssets.pepper,
    ),
    CardItemModel(
      name: "Pepper",
      rating: "4.0",
      reviews: "(80)",
      price: "8.00",
      image: AppAssets.milkEgg,
    ),
  ];

  List<CardItemModel> productCart = [];

  void addToCart(CardItemModel product) {
    setState(() {
      if (productCart.contains(product)) {
        productCart.remove(product);
      } else {
        productCart.add(product);
      }
    });
  }

  bool isSelected(CardItemModel product) {
    return productCart.contains(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(AppAssets.motor),
            widthSpace(10),
            Text(
              "61 Hopper street..",
              style: AppTextStyle.font16BlackW600.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            widthSpace(10),
            const Icon(Icons.keyboard_arrow_down),
            const Spacer(),
            SvgPicture.asset(AppAssets.cart),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            // Banner Carousel
            CarouselSlider.builder(
              itemCount: bannerImages.length,
              options: CarouselOptions(
                height: 200.h,
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

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                children: [
                  // Categories Section
                  SizedBox(
                    height: 100.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      separatorBuilder: (context, index) {
                        return widthSpace(20);
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: 70.w,
                              height: 70.h,
                              decoration: const BoxDecoration(
                                color: AppColorsManager.kBackgroundColor,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(
                                categories[index].image,
                                width: 43.w,
                                height: 43.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            heightSpace(8),
                            Text(
                              categories[index].name,
                              style: AppTextStyle.font12GreyW600,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  heightSpace(17),
                  Row(
                    children: [
                      Text("Fruits", style: AppTextStyle.font16BlackW600),
                      const Spacer(),
                      Text("See all", style: AppTextStyle.font16PrimaryW600),
                    ],
                  ),
                  heightSpace(17),

                  // Product Items Card Section
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(productItems.length, (index) {
                        final product = productItems[index];
                        return ProductItems(
                          image: product.image,
                          name: product.name,
                          rating: product.rating,
                          reviews: product.reviews,
                          price: product.price,
                          icon: IconButton(
                            onPressed: () => addToCart(product),
                            icon: isSelected(product)
                                ? const Icon(
                                    Icons.clear_outlined,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.add_shopping_cart_outlined,
                                    color: AppColorsManager.kPrimaryColor,
                                  ),
                            style: IconButton.styleFrom(
                              backgroundColor: AppColorsManager.kScaffoldColor,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 60.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: BoxDecoration(
                  color: AppColorsManager.kPrimaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 160.w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 50.w,
                            height: 50.h,
                            padding: EdgeInsets.all(5.w),
                            decoration: const BoxDecoration(
                              color: AppColorsManager.kScaffoldColor,
                              shape: BoxShape.circle,
                            ),
                            margin: EdgeInsets.only(right: 5.w),
                            alignment: Alignment.center,
                            child: Image.asset(productCart[index].image,
                                width: 35.w, fit: BoxFit.contain),
                          );
                        },
                        itemCount: productCart.length,
                      ),
                    ),
                    const Spacer(),
                    const VerticalDivider(
                      color: AppColorsManager.kScaffoldColor,
                      thickness: 1.5,
                      width: 2,
                      endIndent: 10,
                      indent: 10,
                    ),
                    widthSpace(10),
                    Text("View Basket", style: AppTextStyle.font16WhiteW600),
                    widthSpace(10),
                    Badge(
                      label: Text(
                        productCart.length.toString(),
                      ),
                      isLabelVisible: productCart.isNotEmpty,
                      
                      child: SvgPicture.asset(AppAssets.cart,
                          colorFilter: const ColorFilter.mode(
                              AppColorsManager.kScaffoldColor,
                              BlendMode.srcIn)),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

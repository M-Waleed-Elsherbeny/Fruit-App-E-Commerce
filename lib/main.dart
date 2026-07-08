import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/styles/colors/app_colors_manager.dart';
import 'package:fruit_app/features/home/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, _) {
        return MaterialApp(
          title: 'Fruit App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColorsManager.kScaffoldColor,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),

          home: const HomeScreen(),
        );
      },
    );
  }
}

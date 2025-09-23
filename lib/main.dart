import 'package:dailytask_app/ui/auth/login/login_view.dart';
import 'package:dailytask_app/ui/auth/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(scaffoldBackgroundColor: AppColors.whiteColor),
          home: const SplashView(),
          //home: ProductdetailView(),
        );
      },
    );
  }
}

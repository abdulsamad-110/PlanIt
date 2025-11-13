import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:planit/ui/auth/splash/splash_controller.dart';
import 'package:planit/ui/utils/app_colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    /// Controller ko bind karna
    final SplashController controller = Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.greeycolor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 80.sp,
                color: AppColors.whiteColor,
              ),
              SizedBox(height: 20.h),

              Text(
                "Welcome to To-Do App",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),

              Text(
                "Stay organized, stay productive",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.extraLightGrey,
                ),
              ),
              SizedBox(height: 30.h),

              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

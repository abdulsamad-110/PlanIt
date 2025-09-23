import 'package:dailytask_app/ui/signup/signup_controller.dart';
import 'package:dailytask_app/ui/utils/app_colors.dart';
import 'package:dailytask_app/ui/widgets/mycustom_button.dart';
import 'package:dailytask_app/ui/widgets/mycustom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(size: 22.sp, Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
            // Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// App Icon
              Icon(
                Icons.check_circle,
                size: 90.sp,
                color: AppColors.greeycolor,
              ),
              SizedBox(height: 20.h),

              /// Login Title
              Text(
                "User Registration",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),

              /// Description text
              Text(
                "Please fill in the details to create your account.",
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.h),
              ///// First Name
              CustomTextField(
                controller: controller.firstNameController,
                isBorder: true,
                borderColor: AppColors.blackColor,
                hintText: 'Enter your name',
                titleText: 'First Name',
              ),
              SizedBox(height: 12.h),
              ///// Last Name
              CustomTextField(
                controller: controller.lastNameController,
                isBorder: true,
                hintText: 'Enter your name',
                titleText: 'Last Name',
              ),
              SizedBox(height: 12.h),
              ///// Phone Number
              CustomTextField(
                controller: controller.phoneController,
                isBorder: true,
                hintText: '+1 515 513XXXX',
                titleText: 'Phone Number',
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 12.h),

              /// Email Field
              CustomTextField(
                controller: controller.emailController,
                isBorder: true,
                hintText: "example@gmail.com",
                titleText: "Email",
              ),
              SizedBox(height: 12.h),

              /// Password Field with toggle
              Obx(
                () => CustomTextField(
                  controller: controller.passwordController,
                  isBorder: true,
                  obscureText: controller.isPwdHidden.value,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: controller.togglePassword,
                    icon: Icon(
                      controller.isPwdHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: 20.sp,
                    ),
                  ),
                  hintText: "********",
                  titleText: "Password",
                ),
              ),
              SizedBox(height: 20.h),

              /// Login Button
              MycustomButton(
                backgroundColor: AppColors.greeycolor,
                height: 48.h,
                width: 315.w,
                title: "Submit",
                onPressed: controller.signUp,
              ),
              // SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

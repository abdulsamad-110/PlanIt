import 'package:dailytask_app/ui/auth/login/login_controller.dart';
import 'package:dailytask_app/ui/signup/signup_view.dart';
import 'package:dailytask_app/ui/utils/app_colors.dart';
import 'package:dailytask_app/ui/widgets/mycustom_button.dart';
import 'package:dailytask_app/ui/widgets/mycustom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Center(
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
                  "Login",
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),

                /// Description text
                Text(
                  "Welcome back! Please login to continue.",
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),

                /// Email Field
                CustomTextField(
                  controller: controller.emailController,
                  isBorder: true,
                  hintText: "example@gmail.com",
                  titleText: "Email",
                ),
                SizedBox(height: 16.h),

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
                SizedBox(height: 10.h),

                /// Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Forgot password logic
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.greeycolor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                /// Login Button
                MycustomButton(
                  backgroundColor: AppColors.greeycolor,
                  height: 48.h,
                  width: 315.w,
                  title: "Login",
                  onPressed: controller.login,
                ),
                SizedBox(height: 20.h),

                /// Divider with text
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        "OR",
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                  ],
                ),
                SizedBox(height: 20.h),

                /// Sign Up Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Navigate to SignUp screen
                        Get.to(() => const SignupView());
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greeycolor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

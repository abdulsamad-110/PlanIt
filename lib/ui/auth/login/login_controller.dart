import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planit/ui/todo/todo_view.dart';
import 'package:planit/ui/utils/app_colors.dart';
import 'package:planit/ui/utils/common_function.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isPwdHidden = true.obs;

  void togglePassword() {
    isPwdHidden.value = !isPwdHidden.value;
  }

  ///// Login Logic
  void login() {
    String? error = fieldValidation();

    if (error != null) {
      CommonFunctions.showMessage(
        title: "Error",
        msg: error,
        color: AppColors.redColor,
      );
      return;
    }

    /// If validation passed
    CommonFunctions.showMessage(
      title: "Success",
      msg: "Login successful",
      color: AppColors.onelightgreencolor,
    );

    // Navigate to main screen
    Get.off(() => const TodoView());

    // Clear fields after login
    clearTextFields();
  }

  ///// Validation for email and password
  String? fieldValidation() {
    if (emailController.text.trim().isEmpty) {
      return 'Email is required.';
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      return 'Enter a valid email address.';
    } else if (passwordController.text.trim().isEmpty) {
      return 'Password is required.';
    }
    return null;
  }

  ///// Clear fields
  void clearTextFields() {
    emailController.clear();
    passwordController.clear();
  }

  // @override
  // void onClose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }
}

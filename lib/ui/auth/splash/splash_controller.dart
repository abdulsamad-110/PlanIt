import 'dart:async';
import 'package:get/get.dart';
import 'package:planit/ui/auth/login/login_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNext();
  }

  void _navigateToNext() {
    Timer(const Duration(seconds: 3), () {
      /// Navigate to Login screen (change if needed)
      Get.offAll(() => const LoginView());
    });
  }
}

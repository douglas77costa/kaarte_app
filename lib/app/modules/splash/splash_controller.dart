import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/data/repository/auth_repository.dart';
import 'package:kaarte_app/app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigateTo();
    super.onInit();
  }

  void navigateTo() async {
    await 2.delay();
    if (AuthRepository.isLogged()) {
      Get.offAllNamed(AppRoutes.HOME);
    } else {
      Get.offAllNamed(AppRoutes.LOGIN);
    }
  }
}

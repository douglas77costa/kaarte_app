import 'package:get/get.dart';

import 'controller.dart';

class SplashpageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashpageController>(() => SplashpageController());
  }
}

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:kaarte_app/app/modules/splash/splash_binding.dart';
import 'package:kaarte_app/app/modules/splash/splash_page.dart';

import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding()),
  ];
}

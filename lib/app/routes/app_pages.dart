import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:kaarte_app/app/modules/home/home_binding.dart';
import 'package:kaarte_app/app/modules/home/home_page.dart';
import 'package:kaarte_app/app/modules/login/login_binding.dart';
import 'package:kaarte_app/app/modules/login/login_page.dart';
import 'package:kaarte_app/app/modules/profile/profile_binding.dart';
import 'package:kaarte_app/app/modules/profile/profile_page.dart';
import 'package:kaarte_app/app/modules/splash/splash_binding.dart';
import 'package:kaarte_app/app/modules/splash/splash_page.dart';

import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.HOME,
        page: () => HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.PROFILE,
        page: () => ProfilePage(),
        binding: ProfileBinding()),
  ];
}

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:kaarte_app/app/routes/app_pages.dart';
import 'package:kaarte_app/app/routes/app_routes.dart';
import 'package:kaarte_app/app/theme/theme_data.dart';



class AppWidget extends StatelessWidget {

  final FirebaseAnalyticsObserver fireObserver;

  AppWidget({Key? key, required this.fireObserver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return GetMaterialApp(
        initialRoute: AppRoutes.SPLASH,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver(),fireObserver],
        defaultTransition: Transition.rightToLeftWithFade,
        debugShowCheckedModeBanner: false,
        title: 'KaArte',
        getPages: AppPages.pages,
        theme: lightThemeData(context),
        themeMode: ThemeMode.light,
      );
  }
}

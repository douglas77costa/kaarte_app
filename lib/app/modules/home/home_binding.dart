import 'package:get/get.dart';
import 'package:kaarte_app/app/modules/catalog/catalog_controller.dart';
import 'package:kaarte_app/app/modules/create/create_controller.dart';
import 'package:kaarte_app/app/modules/menu/menu_controller.dart';
import 'package:kaarte_app/app/modules/search/search_controller.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.put(CatalogController());
    Get.put(SearchController());
    Get.put(CreateController());
    Get.put(MenuController());
  }
}

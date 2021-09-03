import 'package:get/get.dart';
import 'package:kaarte_app/app/data/repository/products_repository.dart';

class CatalogController extends GetxController {

  @override
  void onReady() {
    ProductsRepository.getAllProducts();
    super.onReady();
  }

}

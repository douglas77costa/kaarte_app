import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/data/model/products_model/products_model.dart';
import 'package:kaarte_app/app/data/repository/products_repository.dart';
import 'package:kaarte_app/app/shared/components/custom_snackbar/custom_snackbar.dart';
import 'package:kaarte_app/app/shared/components/status_type.dart';
import 'package:kaarte_app/app/utils/util.dart';

class SearchController extends GetxController {
  final productsList = <ProductsModel>[];
  final resultList = <ProductsModel>[].obs;

  @override
  void onReady() {
    getProducts();
    super.onReady();
  }

  void getProducts() async {
    if (await Util.isConnected(Get.context!)) {
      try {
        productsList.clear();
        var list = await ProductsRepository.getAllProducts();
        if (list!.isNotEmpty) {
          productsList.addAll(list);
        }
      } on FirebaseException catch (e) {
        CustomSnackbar.showTopSnackbar(
            "Erro ao listar Quadros: ${e.message}", Get.context!,
            type: SnackType.WARNING);
      }
    }
  }

  void searchProduct(String keyword) {
    resultList.clear();
    resultList.addAll(productsList.where((product) {
      if (product.cod.toString().contains(keyword) ||
          product.name!.contains(keyword)) {
        return true;
      } else {
        return false;
      }
    }));
    resultList.forEach((element) {
      print(element.name);
    });
  }
}

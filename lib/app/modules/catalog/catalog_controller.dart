import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/data/model/products_model/products_model.dart';
import 'package:kaarte_app/app/data/repository/products_repository.dart';
import 'package:kaarte_app/app/shared/components/custom_snackbar/custom_snackbar.dart';
import 'package:kaarte_app/app/shared/components/status_type.dart';
import 'package:kaarte_app/app/utils/util.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class CatalogController extends GetxController {

  final _status = StatusType.LOAD.obs;
  get status => this._status.value;
  set status(value) => this._status.value = value;

  final productsList = <ProductsModel>[].obs;

  @override
  void onReady() {
    getProducts();
    super.onReady();
  }

  void getProducts() async {
    if (await Util.isConnected(Get.context!)) {
      try {
        status = StatusType.LOAD;
        productsList.clear();
        var list = await ProductsRepository.getAllProducts();
        if (list!.isNotEmpty) {
          productsList.addAll(list);
        } else {
          status = StatusType.EMPTY;
        }
        status = StatusType.SUCCESS;
      } on FirebaseException catch (e) {
        status = StatusType.ERROR;
        CustomSnackbar.showTopSnackbar(
            "Erro ao listar Quadros: ${e.message}", Get.context!,
            type: SnackType.WARNING);
      }
    }
  }

}

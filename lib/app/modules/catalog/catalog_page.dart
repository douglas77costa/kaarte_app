import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/theme/colors.dart';

import 'catalog_controller.dart';

class CatalogPage extends StatelessWidget {
  final controller = Get.find<CatalogController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "CÁTALOGO DE QUADROS",
          style: TextStyle(
              color: ColorsApp.textColorBody,
              fontWeight: FontWeight.normal,
              fontSize: 16),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
    );
  }
}

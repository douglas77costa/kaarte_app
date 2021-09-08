import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/modules/catalog/components/product_item_grid.dart';
import 'package:kaarte_app/app/shared/components/custom_load/custom_load.dart';
import 'package:kaarte_app/app/shared/components/status_type.dart';
import 'package:kaarte_app/app/theme/colors.dart';

import 'catalog_controller.dart';

class CatalogPage extends GetView<CatalogController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          "CÁTALOGO DE PRODUTOS".capitalizeFirst!,
          style: TextStyle(
              color: ColorsApp.textColorBody,
              fontWeight: FontWeight.normal,
              fontSize: 16),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.grey[50],
      body: Obx(() {
        switch (controller.status) {
          case StatusType.LOAD:
            return Center(
              child: CustomLoad(),
            );
          case StatusType.SUCCESS:
            return Container(
              margin: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 7,
                      childAspectRatio: 16 / 17.5),
                  itemCount: controller.productsList.length,
                  itemBuilder: (context, index) {
                    return ProductItemGrid(
                        productsModel: controller.productsList[index]);
                  }),
            );
          default:
            return Container();
        }
      }),
    );
  }
}

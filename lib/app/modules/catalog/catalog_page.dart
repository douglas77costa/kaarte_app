import 'package:flutter/material.dart';
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
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Cátalogo de Quadros",
          style: TextStyle(
              color: ColorsApp.primary,
              fontWeight: FontWeight.normal,
              fontSize: 18),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      //backgroundColor: Colors.grey[50],
      body: Obx(() {
        switch (controller.status) {
          case StatusType.LOAD:
            return Center(
              child: CustomLoad(),
            );
          case StatusType.SUCCESS:
            return Container(
              margin: EdgeInsets.only(left: 0,right: 0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
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

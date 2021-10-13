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
        backgroundColor: Colors.white,
        title: Text(
          "Cátalogo de Quadros",
          style: TextStyle(color: ColorsApp.primary, fontSize: 22),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      //backgroundColor: ColorsApp.backgroundBody,
      body: Obx(() {
        switch (controller.status) {
          case StatusType.LOAD:
            return Center(
              child: CustomLoad(),
            );
          case StatusType.SUCCESS:
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.asset("assets/images/bg.png",fit:BoxFit.fitWidth,),
                Container(
                  margin: EdgeInsets.only(left: 0,right: 0),
                  child: GridView.builder(
                      padding: EdgeInsets.only(top: 10,bottom: 10,left: 5,right: 5),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 16 / 17.5),
                      itemCount: controller.productsList.length,
                      itemBuilder: (context, index) {
                        return ProductItemGrid(
                            productsModel: controller.productsList[index]);
                      }),
                )
              ],
            );
          default:
            return Container();
        }
      }),
    );
  }
}

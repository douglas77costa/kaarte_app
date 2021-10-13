import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaarte_app/app/data/model/products_model/products_model.dart';
import 'package:kaarte_app/app/modules/profile/profile_controller.dart';
import 'package:kaarte_app/app/shared/components/custom_button/rounded_custom_button.dart';
import 'package:kaarte_app/app/theme/colors.dart';
import 'package:screenshot/screenshot.dart';

import '../catalog_controller.dart';

class ProductViewBottomSheet extends GetView<CatalogController> {
  ProductViewBottomSheet(this.productsModel, {Key? key}) : super(key: key);
  static const keyCache = 'customCacheKey';
  final ProductsModel productsModel;
  final currency = new NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Icon(FluentIcons.info_24_regular,
              size: 30, color: ColorsApp.primary),
          centerTitle: true,
          title: Text(
            'Informações do Quadro',
            style: TextStyle(
                fontSize: 18,
                letterSpacing: 0.7,
                color: ColorsApp.textColorBody),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(FluentIcons.dismiss_24_regular,
                    size: 30, color: ColorsApp.primary))
          ],
        ),
        body: Screenshot(
          controller: controller.screenshotController,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(24),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.accent, width: 6),
                    borderRadius: BorderRadius.circular(6)),
                child: CachedNetworkImage(
                  imageUrl: productsModel.pathImage!,
                  cacheManager: CacheManager.custom(Config(
                    keyCache,
                    stalePeriod: const Duration(seconds: 1),
                    maxNrOfCacheObjects: 0,
                  )),
                  placeholder: (context, url) {
                    return AspectRatio(
                      aspectRatio: 16 / 9,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CupertinoActivityIndicator(),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
                title: Text(
                  'Código de Referência',
                  style: TextStyle(fontSize: 14),
                ),
                subtitle: Text(
                  '${productsModel.cod.toString()}',
                  style: TextStyle(color: ColorsApp.primary, fontSize: 16),
                ),
                trailing: Icon(FluentIcons.database_24_regular,color: ColorsApp.primary),
                isThreeLine: true,
              ),
              //Divider(),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
                title: Text(
                  'Título da obra',
                  style: TextStyle(fontSize: 14),
                ),
                subtitle: Text(
                  '${productsModel.name}',
                  style: TextStyle(color: ColorsApp.primary, fontSize: 16),
                ),
                trailing: Icon(FluentIcons.text_edit_style_24_regular,color: ColorsApp.primary,),
                isThreeLine: true,
              ),
              //Divider(),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
                title: Text(
                  'Descrição da obra',
                  style: TextStyle(fontSize: 14),
                ),
                subtitle: Text(
                  '${productsModel.description}',
                  style: TextStyle(color: ColorsApp.primary, fontSize: 16),
                ),
                trailing: Icon(
                    FluentIcons.notepad_24_regular,
                    color: ColorsApp.primary
                ),
                isThreeLine: true,
              ),
              //Divider(),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
                title: Text(
                  'Preço',
                  style: TextStyle(fontSize: 14),
                ),
                subtitle: Text(
                  currency.format(productsModel.price),
                  style: TextStyle(color: ColorsApp.primary, fontSize: 16),
                ),
                trailing: Icon(
                    FluentIcons.money_24_regular,
                    color: ColorsApp.primary
                ),
                isThreeLine: true,
              ),
              //Divider(),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 10),
          child: RoundedCustomButton(
            isSolid: true,
            color: Colors.white,
            text: "COMPARTILHAR",
            onPressed: () {
              controller.shareProduct();
            },
          ),
        ),
      ),
    );
  }
}

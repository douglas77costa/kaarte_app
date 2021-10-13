import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kaarte_app/app/data/model/products_model/products_model.dart';
import 'package:kaarte_app/app/modules/catalog/components/product_view_bottom_sheet.dart';
import 'package:kaarte_app/app/theme/colors.dart';

class ProductItemGrid extends StatelessWidget {
  final ProductsModel productsModel;
  static const keyCache = 'customCacheKey';
  const ProductItemGrid({Key? key, required this.productsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10,bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: ColorsApp.backgroundBody,
              width:2
          ),
          borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          child: InkWell(
            onTap: () => showCustomButtonSheet(context),
            child: Column(
              children: [
                CachedNetworkImage(
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
                Container(
                  child: ListTile(
                    title: RichText(
                        text: TextSpan(
                            text: "Ref: ",
                            style: TextStyle(
                                color: ColorsApp.accent, fontSize: 16),
                            children: [
                          TextSpan(
                              text: "${productsModel.cod}",
                              style: TextStyle(
                                  color: ColorsApp.accent,
                                  fontWeight: FontWeight.bold))
                        ])),
                    isThreeLine: true,
                    subtitle: Text("${productsModel.name}"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    //return Image.network(productsModel.pathImage!);
  }

  void showCustomButtonSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (context) {
          return SafeArea(child: ProductViewBottomSheet(productsModel));
        });
  }
}

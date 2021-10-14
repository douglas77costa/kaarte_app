import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:kaarte_app/app/data/model/products_model/products_model.dart';
import 'package:kaarte_app/app/shared/components/product_view_bottom_sheet/product_view_bottom_sheet.dart';
import 'package:kaarte_app/app/theme/colors.dart';

class ProductItemSearch extends StatelessWidget {
  final ProductsModel productsModel;
  static const keyCache = 'customCacheKey';
  const ProductItemSearch({Key? key, required this.productsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => showCustomButtonSheet(context),
        child: ListTile(
          leading: CachedNetworkImage(
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
          title: Text(productsModel.name!,
              style: TextStyle(
                  color: ColorsApp.primary, fontWeight: FontWeight.bold)),
          subtitle: Text(productsModel.description!),
          isThreeLine: true,
          trailing: Text("REF: ${productsModel.cod.toString()}",
              style: TextStyle(
                  color: ColorsApp.accent, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  void showCustomButtonSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (context) {
          return ProductViewBottomSheet(productsModel);
        });
  }
}

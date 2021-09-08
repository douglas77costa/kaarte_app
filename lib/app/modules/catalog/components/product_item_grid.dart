import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:kaarte_app/app/data/model/products_model/products_model.dart';
import 'package:kaarte_app/app/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

class ProductItemGrid extends StatelessWidget {
  final ProductsModel productsModel;
  static const keyCache = 'customCacheKey';
  const ProductItemGrid({Key? key, required this.productsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 1,
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
                return SizedBox(
                  height: 50,
                  width: 50,
                  child: SpinKitDoubleBounce(
                    color: Colors.grey[300],
                    size: 50.0,
                  ),
                );
              },
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Container(
              child: ListTile(
                title: Text(
                  "Código: ${productsModel.cod}",
                  style: TextStyle(color: ColorsApp.accent),
                ),
                isThreeLine: true,
                subtitle: Text("${productsModel.name}"),
              ),
            ),
          ],
        ),
      ),
    );
    //return Image.network(productsModel.pathImage!);
  }
}

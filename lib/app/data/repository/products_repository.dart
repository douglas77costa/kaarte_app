import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kaarte_app/app/data/model/products_model/products_model.dart';

class ProductsRepository {
  static const String PRODUCTS_DB = "products";

  static CollectionReference products =
      FirebaseFirestore.instance.collection(PRODUCTS_DB);

  static Future<void> saveProducts(ProductsModel productModel) async {
    await products.doc(productModel.cod.toString()).set(productModel.toJson());
  }

  static Future<List<ProductsModel>?> getAllProducts() async {
    QuerySnapshot querySnapshot = await products.orderBy("cod").get();
    var map = querySnapshot.docs.map((doc) => doc.data());
    var list = map
        .map((dynamic i) => ProductsModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return list;
  }
}

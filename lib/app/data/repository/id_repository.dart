

import 'package:cloud_firestore/cloud_firestore.dart';



class IdRepository {
  static const String ID_DB = "id_generate";
  static const String PRODUCT_ID = "products";

  static CollectionReference idGenerate = FirebaseFirestore.instance.collection(ID_DB);

  /*static Future<void> saveUser(UserModel userModel) async {
    await users.doc(userModel.authId).set(userModel.toJson());
  }*/

  static Future<int> getIDProducts() async {
    var idProduct = await idGenerate.doc(PRODUCT_ID).snapshots().first;
    var data = idProduct.data() as Map<String, dynamic>;
    return data["id"];
  }

  static Future incrementId(int id)async{
    Map<String, dynamic> newIdJson= {
      "id":id+1
    };
    await idGenerate.doc(PRODUCT_ID).set(newIdJson);
  }
}

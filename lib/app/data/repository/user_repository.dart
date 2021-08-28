
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kaarte_app/app/data/model/user_model.dart';

import 'auth_repository.dart';


class UserRepository {
  static const String USER_DB = "users";

  static CollectionReference users = FirebaseFirestore.instance.collection(USER_DB);

  static Future<void> saveUser(UserModel userModel) async {
    await users.doc(userModel.authId).set(userModel.toJson());
  }

  static Future<void> updateUserField(UserModel userModel) async {
    await users.doc(userModel.authId).set(userModel.toJson());
  }

  static Future<UserModel> getUser() async {
    var user = await users.doc(AuthRepository.getAuthUser()!.uid).snapshots().first;
    return UserModel.fromJson(user.data()! as Map<String, dynamic>);
  }
}

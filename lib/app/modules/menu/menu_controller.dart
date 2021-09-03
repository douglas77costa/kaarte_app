import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/data/repository/auth_repository.dart';
import 'package:kaarte_app/app/data/repository/user_repository.dart';
import 'package:kaarte_app/app/routes/app_routes.dart';
import 'package:kaarte_app/app/shared/components/custom_dialog/custom_dialog.dart';
import 'package:kaarte_app/app/utils/util.dart';

class MenuController extends GetxController {
  final _name = "".obs;

  get name => this._name.value;
  set name(name)=> this._name.value = name;

  @override
  void onReady() {
    WidgetsBinding.instance?.addPostFrameCallback((_) => getProfile());
    super.onReady();
  }

  void getProfile()async{
    final user = await UserRepository.getUser();
    name = "${user.name}";
  }

  void logOut(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
            title: "FAZER LOGOUT",
            descriptions: "Tem certeza que deseja sair de sua conta?",
            type: DialogType.SUCCESS,
            okText: "Sair",
            cancelText: "Agora Não",
            cancelOnPressed: () => Get.back(),
            okOnPressed: () async {
              Util.showLoad();
              await singOut();
              Util.hideLoad();
              Get.offAllNamed(AppRoutes.LOGIN);
            },
          );
        });
  }

  Future<void> singOut()async{
    await FirebaseFirestore.instance.terminate();
    await FirebaseFirestore.instance.clearPersistence();
    await AuthRepository.signOut();
  }
}

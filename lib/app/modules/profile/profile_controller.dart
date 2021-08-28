import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/data/model/user_model.dart';
import 'package:kaarte_app/app/data/repository/auth_repository.dart';
import 'package:kaarte_app/app/data/repository/user_repository.dart';
import 'package:kaarte_app/app/shared/components/custom_snackbar/custom_snackbar.dart';

class ProfileController extends GetxController {
  var _isLoad = true.obs;
  get isLoad => this._isLoad.value;
  set isLoad(value) => this._isLoad.value = value;

  final _user = UserModel().obs;
  get user => this._user.value;
  set user(value) => this._user.value = value;

  var name = "";
  var email = "";
  var password = "";

  final formNameKey = GlobalKey<FormState>();
  final formEmailKey = GlobalKey<FormState>();
  final formPassKey = GlobalKey<FormState>();

  @override
  void onReady() {
    WidgetsBinding.instance?.addPostFrameCallback((_) => getProfile());
    super.onReady();
  }

  void getProfile() async {
    isLoad = true;
    user = await UserRepository.getUser();
    isLoad = false;
  }

  void updatePassword() async{
    if (formPassKey.currentState!.validate()) {
      UserModel userModel = user;
      try {
        isLoad = true;
        await AuthRepository.updatePassword(password, userModel);
        userModel.password = password;
        await UserRepository.updateUserField(userModel);
        getProfile();
        isLoad = false;
        CustomSnackbar.showTopSnackbar("Dados salvos com sucesso!", Get.context!,
            title: "Tudo certo!", type: SnackType.SUCCESS);
      } on FirebaseAuthException catch (e) {
        isLoad = false;
        CustomSnackbar.showTopSnackbar(
            "Erro ao atualizar dados: ${e.message}", Get.context!,
            type: SnackType.WARNING, title: "Ops...");
      }
    }
  }

  void updateName() {
    if (formNameKey.currentState!.validate()) {
      UserModel userModel = user;
      userModel.name = name;
      _updateUser(userModel);
    }
  }

  void updateEmail() async{
    if (formEmailKey.currentState!.validate()) {
      UserModel userModel = user;
      try {
        isLoad = true;
        await AuthRepository.updateEmail(email, userModel);
        userModel.email = email;
        await UserRepository.updateUserField(userModel);
        getProfile();
        isLoad = false;
        CustomSnackbar.showTopSnackbar("Dados salvos com sucesso!", Get.context!,
            title: "Tudo certo!", type: SnackType.SUCCESS);
      } on FirebaseAuthException catch (e) {
        isLoad = false;
        CustomSnackbar.showTopSnackbar(
            "Erro ao atualizar dados: ${e.message}", Get.context!,
            type: SnackType.WARNING, title: "Ops...");
      }
    }
  }

  void _updateUser(UserModel userModel) async {
    try {
      isLoad = true;
      await UserRepository.updateUserField(userModel);
      getProfile();
      isLoad = false;
      CustomSnackbar.showTopSnackbar("Dados salvos com sucesso!", Get.context!,
          title: "Tudo certo!", type: SnackType.SUCCESS);
    } on FirebaseAuthException catch (e) {
      isLoad = false;
      CustomSnackbar.showTopSnackbar(
          "Erro ao atualizar dados: ${e.message}", Get.context!,
          type: SnackType.WARNING, title: "Ops...");
    }
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty || value.length < 2) {
      return "Nome não pode ser vazio";
    }
    name = value;
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.isEmail) {
      return "Email inválido";
    }
    email = value;
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return "A senha deve ter no mínimo 6 caracteres";
    }
    password = value;
    return null;
  }

  String? validateCheckPass(String? value) {
    if (value == null || value.isEmpty || value != password) {
      return "As senhas não correspondem";
    }
    return null;
  }
}

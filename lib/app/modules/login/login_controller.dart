import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/data/repository/auth_repository.dart';
import 'package:kaarte_app/app/routes/app_routes.dart';
import 'package:kaarte_app/app/shared/components/custom_snackbar/custom_snackbar.dart';
import 'package:kaarte_app/app/utils/util.dart';

class LoginController extends GetxController {
  var email = "";
  var password = "";

  Future<void> loginUser(
      GlobalKey<FormState> formKey, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        Util.showLoad(context);
        await AuthRepository.login(email, password);
        Util.hideLoad();
        Get.offAllNamed(AppRoutes.HOME);
      } on FirebaseAuthException catch (e) {
        Util.hideLoad();
        if (e.code.contains(AuthError.WRONG_PASS)) {
          CustomSnackbar.showTopSnackbar(
              AuthError.AUTH_ERROR[AuthError.WRONG_PASS]!, context,
              type: SnackType.WARNING);
        } else if (e.code.contains(AuthError.USER_NOT_FOUND)) {
          CustomSnackbar.showTopSnackbar(
              AuthError.AUTH_ERROR[AuthError.USER_NOT_FOUND]!, context,
              type: SnackType.WARNING);
        } else {
          CustomSnackbar.showTopSnackbar("Erro ao entrar", context,
              type: SnackType.WARNING);
        }
      }
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || value.length < 3 || !value.isEmail) {
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
}

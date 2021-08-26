import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/theme/colors.dart';


enum SnackType { SUCCESS, WARNING, DANGER, DEFAULT }

abstract class CustomSnackbar {
  static showTopSnackbar(String text, BuildContext context,
      {String title = "Atenção", SnackType type = SnackType.DEFAULT}) {
    late Color titleColor;

    switch (type) {
      case SnackType.SUCCESS:
        titleColor = ColorsApp.primary;
        break;
      case SnackType.WARNING:
        titleColor = ColorsApp.redDanger;
        break;
      case SnackType.DANGER:
        titleColor = ColorsApp.orangeWarning;
        break;
      case SnackType.DEFAULT:
        titleColor = Color(0xFF1C1C1C);
        break;
    }

    Get.snackbar(title, text,
        titleText: Text(
          title,
          style: TextStyle(
              color: titleColor, fontSize: 16, fontWeight: FontWeight.w900),
        ),
        duration: Duration(seconds: 5),
        margin: EdgeInsets.only(top: 20, left: 15, right: 15));
  }

  static showBottomSnackbar(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: ColorsApp.primaryDark),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
      padding: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
    ));
  }
}


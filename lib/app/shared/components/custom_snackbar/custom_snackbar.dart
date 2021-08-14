import 'package:flutter/material.dart';
import 'package:kaarte_app/app/theme/colors.dart';


abstract class CustomSnackbar{

  static showSnackbar(String text, BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: ColorsApp.primaryDark),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 30),
      padding: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
    ));
  }
}

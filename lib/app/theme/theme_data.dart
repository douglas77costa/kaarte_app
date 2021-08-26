import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaarte_app/app/utils/util.dart';

import 'colors.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
      primaryColor: ColorsApp.primary,
      accentColor: ColorsApp.accent,
      primaryColorDark: ColorsApp.primaryDark,
      primaryColorLight: ColorsApp.primaryLight,
      scaffoldBackgroundColor: Colors.white,
      focusColor: ColorsApp.accent,
      primarySwatch: Util.createMaterialColor(ColorsApp.primaryDark),
      brightness: Brightness.light,
      errorColor: Colors.redAccent,
      textTheme: GoogleFonts.comfortaaTextTheme(
        Theme.of(context).textTheme.apply(),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: ColorsApp.textColorBody,
              fontWeight: FontWeight.normal,
              fontSize: 16)),
      bottomNavigationBarTheme:
      BottomNavigationBarThemeData(backgroundColor: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
          errorStyle: TextStyle(color: Colors.redAccent),
          contentPadding: EdgeInsets.all(20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.white, width: 0.0),
          )));
}

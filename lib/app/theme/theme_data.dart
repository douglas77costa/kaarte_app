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
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: ColorsApp.textColorBody,
              fontWeight: FontWeight.normal,
              fontSize: 16)),
      focusColor: ColorsApp.accent,
      primarySwatch: Util.createMaterialColor(ColorsApp.primaryDark),
      brightness: Brightness.light,
      errorColor: Colors.redAccent,
      textTheme: GoogleFonts.mPlus1pTextTheme(
        Theme.of(context).textTheme.apply(),
      ),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(color: Colors.redAccent),
        contentPadding: EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.white, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.white, width: 0.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.white, width: 0.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.white, width: 0.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        labelStyle: TextStyle(color: Colors.transparent),
        fillColor: Colors.white,
        filled: true,
      ));
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
      primaryColor: ColorsApp.primary,
      accentColor: ColorsApp.accent,
      primaryColorDark: ColorsApp.primaryDark,
      primaryColorLight: ColorsApp.primaryLight,
      focusColor: ColorsApp.accent,
      primarySwatch: Util.createMaterialColor(ColorsApp.accent),
      brightness: Brightness.dark,
      errorColor: ColorsApp.redDanger,
      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
      textTheme: GoogleFonts.mPlus1pTextTheme(
        Theme.of(context).textTheme.apply(bodyColor: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
          errorStyle: TextStyle(color: ColorsApp.redDanger),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: ColorsApp.accent, width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: ColorsApp.accent, width: 2.0))));
}

final BoxDecoration textFieldDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 7,
      offset: Offset(0, 0), // changes position of shadow
    ),
  ],
);

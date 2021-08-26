import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kaarte_app/app/data/model/user_model.dart';
import 'package:kaarte_app/app/shared/components/custom_snackbar/custom_snackbar.dart';
import 'package:kaarte_app/app/theme/colors.dart';
import 'package:lottie/lottie.dart';

abstract class Util {
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  static Future<bool> isConnected(BuildContext? context,
      {bool showMsg = true}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      if (showMsg) {
        CustomSnackbar.showTopSnackbar(
            "Verifique sua conexão com a internet!", context!);
      }
      return false;
    }
  }

  static void showLoad(BuildContext context) {
    BotToast.showCustomLoading(
        clickClose: false,
        allowClick: false,
        backgroundColor: Colors.white,
        align: Alignment.center,
        toastBuilder: (cancelFunc) {
          return SpinKitThreeBounce(
            color: ColorsApp.primary,
            size: 50.0,
          );
        });
  }

  static void hideLoad() {
    BotToast.closeAllLoading();
  }

  static void recordError(
      String error, StackTrace stackTrace, String reason) async {
    await FirebaseCrashlytics.instance
        .recordError(error, stackTrace, reason: reason);
  }

  static void createUser() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: "douglas123costa@gmail.com", password: "241512");
    String id = user.user!.uid;
    print(id);
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    var userModel = UserModel(
        authId: id,
        email: "douglas123costa@gmail.com",
        name: "Douglas Costa",
        password: "241512");
    await users.doc(userModel.authId).set(userModel.toJson());
  }
}

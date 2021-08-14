import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/theme/colors.dart';
import 'package:lottie/lottie.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Container(
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    child: Lottie.asset('assets/images/logo.png',repeat: false),
                  ),
                  Container(
                    width: 250,
                    margin: EdgeInsets.only(top: 15),
                    child: Text(
                      "Consumo na sua Mão!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color:Colors.white,fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              margin: EdgeInsets.only(bottom: 10),
              child: Image.asset("assets/images/live_slogan_white.png"),
            ),
          ],
        ),
      ),
    );
  }
}

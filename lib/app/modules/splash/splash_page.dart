import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              width: 200,
              margin: EdgeInsets.only(bottom: 10),
              child: Image.asset("assets/images/logo.png"),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text("DC AppLab",style: TextStyle(fontSize: 16),),
            )
          ],
        ),
      ),
    );
  }
}

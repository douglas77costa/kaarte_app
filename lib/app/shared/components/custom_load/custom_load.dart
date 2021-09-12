
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kaarte_app/app/theme/colors.dart';

class CustomLoad extends StatelessWidget {

  CustomLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitThreeBounce(
        color: ColorsApp.primary,
        size: 50.0,
      ),
    );
  }
}

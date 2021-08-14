
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoad extends StatelessWidget {
  final double? width;
  final double? height;

  CustomLoad({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height == null ? 100 : height,
      width: width == null ? 100 : width,
      child: Lottie.asset('assets/animation/load.json',
          repeat: true, width: width, height: height, reverse: false),
    );
  }
}

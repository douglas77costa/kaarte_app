import 'package:flutter/material.dart';
import 'package:kaarte_app/app/theme/colors.dart';


class RoundedCustomButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String text;
  final Color color;
  final bool isSolid;

  RoundedCustomButton(
      {required this.onPressed,
      required this.text,
      required this.color,
      required this.isSolid});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      child: MaterialButton(
        onPressed: onPressed,
        color: isSolid ? color : Colors.transparent,
        child: Text(
          text,
          style: TextStyle(
              color: isSolid ? ColorsApp.primary: color,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 16),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
            side: BorderSide(color: color, width: 1.5)),
      ),
    );
  }
}

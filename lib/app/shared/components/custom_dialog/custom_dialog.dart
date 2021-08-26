import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaarte_app/app/theme/colors.dart';


enum DialogType { SUCCESS, WARNING, DANGER, DEFAULT }

class CustomDialog extends StatefulWidget {
  final DialogType type;
  final String title, descriptions;
  final String? okText, cancelText;
  final VoidCallback? okOnPressed, cancelOnPressed;

  CustomDialog(
      {Key? key,
      required this.title,
      required this.descriptions,
      this.okText,
      this.cancelText,
      this.okOnPressed,
      this.cancelOnPressed,
      required this.type})
      : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          insetAnimationCurve: Curves.easeInOutExpo,
          elevation: 1,
          backgroundColor: Colors.transparent,
          child: contentBox(context),
        )
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          headerType(),
          Container(
            margin: EdgeInsets.only(
                left: 10, right: 10, top: 20, bottom: 20),
            child: Text(
              widget.descriptions,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          actionBtn()
        ],
      ),
    );
  }

  Widget actionBtn() {
    if (widget.okText != null && widget.cancelText != null) {
      return Container(
        height: 70,
        child: Column(
          children: [
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextButton(
                      onPressed: () =>widget.okOnPressed!.call(),
                      child: Text(
                        widget.okText!.toUpperCase(),
                        style: TextStyle(
                            color: ColorsApp.primary, fontSize: 14),
                      )),
                ),
                SizedBox(
                  child: VerticalDivider(),
                  height: 50,
                ),
                Container(
                  width: 130,
                  child: TextButton(
                      onPressed: () => widget.cancelOnPressed!.call(),
                      child: Text(
                        widget.cancelText!.toUpperCase(),
                        style: TextStyle(
                            color: ColorsApp.textColorBody, fontSize: 14),
                      )),
                ),
              ],
            )
          ],
        ),
      );
    }
    if (widget.okText != null) {
      return Container(
        height: 70,
        child: Column(
          children: [
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  child: TextButton(
                      onPressed: () => widget.okOnPressed!.call(),
                      child: Text(
                        widget.okText!.toUpperCase(),
                        style: TextStyle(
                            color: ColorsApp.primary, fontSize: 14),
                      )),
                ),
              ],
            )
          ],
        ),
      );
    }
    if (widget.cancelText != null) {
      return Container(
        height: 70,
        child: Column(
          children: [
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  child: TextButton(
                      onPressed: () => widget.cancelOnPressed,
                      child: Text(
                        widget.cancelText!.toUpperCase(),
                        style: TextStyle(
                            color: ColorsApp.textColorBody, fontSize: 14),
                      )),
                ),
              ],
            )
          ],
        ),
      );
    }
    return Container();
  }

  Widget headerType() {
    switch (widget.type) {
      case DialogType.SUCCESS:
        return Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: ColorsApp.primaryLighter,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Center(
            child: Text(
              widget.title.toUpperCase(),
              style: TextStyle(
                  fontSize: 16,
                  color: ColorsApp.primary,
                  fontWeight: FontWeight.w900),
            ),
          ),
        );
      case DialogType.WARNING:
        return Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: ColorsApp.orangeWarningLight,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Center(
            child: Text(
              widget.title.toUpperCase(),
              style: TextStyle(
                  fontSize: 16,
                  color: ColorsApp.orangeWarning,
                  fontWeight: FontWeight.w900),
            ),
          ),
        );
      case DialogType.DANGER:
        return Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: ColorsApp.redDangerLight,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Center(
            child: Text(
              widget.title.toUpperCase(),
              style: TextStyle(
                  fontSize: 16,
                  color: ColorsApp.redDanger,
                  fontWeight: FontWeight.w900),
            ),
          ),
        );
      case DialogType.DEFAULT:
        return Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Center(
            child: Text(
              widget.title.toUpperCase(),
              style: TextStyle(
                  fontSize: 16,
                  color: ColorsApp.primary,
                  fontWeight: FontWeight.w900),
            ),
          ),
        );
    }
  }
}

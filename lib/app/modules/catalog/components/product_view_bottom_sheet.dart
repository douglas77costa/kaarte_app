import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/modules/profile/components/appbar_bottom_sheet.dart';
import 'package:kaarte_app/app/modules/profile/profile_controller.dart';
import 'package:kaarte_app/app/theme/colors.dart';

class ProductViewBottomSheet extends GetView<ProfileController> {
  ProductViewBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        margin: EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: ColorsApp.primaryLight,
                    child: Icon(FluentIcons.info_24_regular,
                        size: 30, color: Colors.white),
                    radius: 18,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      'Informações do Quadro',
                      style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 0.7,
                          fontWeight: FontWeight.w600,
                          color: ColorsApp.textColorBody),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

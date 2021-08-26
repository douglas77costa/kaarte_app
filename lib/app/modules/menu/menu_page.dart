import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/routes/app_routes.dart';
import 'package:kaarte_app/app/theme/colors.dart';

import 'menu_controller.dart';

class MenuPage extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                 // Get.toNamed(AppRoutes.USER_PROFILE)!.then((value) => controller.getProfile());
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      left: 10, right: 5, top: 10, bottom: 0),
                  child: ListTile(
                    title: Obx((){
                      return Text(
                        controller.name,
                        style:
                        TextStyle(color: ColorsApp.primary, fontSize: 22),
                      );
                    }),
                    subtitle: Text(
                      'Ver meu perfil',
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: ColorsApp.primaryLight,
                    ),
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  controller.logOut(context);
                },
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: ColorsApp.primaryLighter,
                      child: Icon(
                        FluentIcons.sign_out_24_regular,
                      ),
                    ),
                    title: Text(
                      'Sair da Conta',
                      style: TextStyle(
                          fontSize: 18, color: ColorsApp.textColorBody),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

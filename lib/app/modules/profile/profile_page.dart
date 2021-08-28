import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/shared/components/custom_load/custom_load.dart';
import 'package:kaarte_app/app/theme/colors.dart';

import 'bottom_sheet_fields/email_bottom_sheet.dart';
import 'bottom_sheet_fields/name_bottom_sheet.dart';
import 'bottom_sheet_fields/password_bottom_sheet.dart';
import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "MEUS DADOS",
          style: TextStyle(
              color: ColorsApp.textColorBody,
              fontWeight: FontWeight.normal,
              fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(result: "load"),
          icon: Icon(
            FluentIcons.ios_arrow_left_24_filled,
            color: ColorsApp.primary,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoad) {
          return Center(
            child: CustomLoad(),
          );
        } else {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      showCustomButtonSheet(NameBottomSheet(), context);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: 5, right: 5, top: 5, bottom: 5),
                      child: ListTile(
                        title: Text(
                          '${controller.user.name}',
                          style: TextStyle(
                              fontSize: 18, color: ColorsApp.primary),
                        ),
                        subtitle: Text("Nome e Sobrenome"),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      showCustomButtonSheet(EmailBottomSheet(), context);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: 5, right: 5, top: 5, bottom: 5),
                      child: ListTile(
                        title: Text(
                          '${controller.user.email ?? ""}',
                          style: TextStyle(
                              fontSize: 18, color: ColorsApp.primary),
                        ),
                        subtitle: Text("Email"),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      showCustomButtonSheet(PasswordBottomSheet(), context);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: 5, right: 5, top: 5, bottom: 5),
                      child: ListTile(
                        title: Text(
                          'Senha',
                          style: TextStyle(
                              fontSize: 18, color: ColorsApp.primary),
                        ),
                        subtitle: Text("Alterar Senha"),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  void showCustomButtonSheet(Widget child, BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (context) {
          return SingleChildScrollView(
            child: child,
          );
        });
  }
}

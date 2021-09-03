import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/shared/components/custom_dialog/custom_dialog.dart';
import 'package:kaarte_app/app/theme/colors.dart';

class AppBarProfileBottomSheet extends StatelessWidget {

  final VoidCallback saveButtonVoid;

  AppBarProfileBottomSheet({Key? key, required this.saveButtonVoid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, top: 15, bottom: 5, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(FluentIcons.dismiss_24_filled),
            color: ColorsApp.redDanger,
            onPressed: () => Get.back(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Alterando Dados",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorsApp.textColorBody),
            ),
          ),
          IconButton(
            icon: Icon(FluentIcons.checkmark_24_filled),
            color: ColorsApp.primary,
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomDialog(
                    title: "SALVAR OS DADOS?",
                    descriptions:
                    "Você está prestes a alterar seus dados. Deseja continuar?",
                    type: DialogType.WARNING,
                    okText: "Salvar",
                    cancelText: "Não",
                    cancelOnPressed: () => Get.back(),
                    okOnPressed: () {
                      saveButtonVoid.call();
                      Get.back();
                      Get.back();
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}

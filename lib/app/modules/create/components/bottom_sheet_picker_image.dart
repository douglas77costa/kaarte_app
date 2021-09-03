import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/modules/create/create_controller.dart';
import 'package:kaarte_app/app/theme/colors.dart';

class BottomSheetPickerImage extends GetView<CreateController> {
  const BottomSheetPickerImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(bottom: 20, top: 20, left: 20, right: 20),
        child: Wrap(
          children: <Widget>[
            ListTile(
                trailing: Icon(
                  FluentIcons.image_add_24_regular,
                  color: ColorsApp.accent,
                ),
                title: Text('Imagem da Galeria'),
                onTap: () {
                  controller.imgFromGallery();
                  Get.back();
                }),
            ListTile(
              trailing:  Icon(
                FluentIcons.camera_24_regular,
                color: ColorsApp.accent,
              ),
              title: Text('Abrir câmera'),
              onTap: () {
                controller.imgFromCamera();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}

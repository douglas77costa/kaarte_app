import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/modules/profile/componentes/appbar_bottom_sheet.dart';
import 'package:kaarte_app/app/modules/profile/profile_controller.dart';

class NameBottomSheet extends GetView<ProfileController> {
  NameBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        margin: EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            AppBarProfileBottomSheet(
              saveButtonVoid: () {
                controller.updateName();
              },
            ),
            Divider(),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: controller.formNameKey,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    validator: (value) => controller.validateName(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    initialValue: controller.user?.name ?? "",
                    keyboardType: TextInputType.name,
                    autofocus: true,
                    decoration: InputDecoration(labelText: 'Nome'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

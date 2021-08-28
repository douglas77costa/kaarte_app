import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/modules/profile/componentes/appbar_bottom_sheet.dart';

import '../profile_controller.dart';

class PasswordBottomSheet extends GetView<ProfileController> {
  PasswordBottomSheet({Key? key}) : super(key: key);

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
                controller.updatePassword();
              },
            ),
            Divider(),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Form(
                  key: controller.formPassKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          validator: (value) =>
                              controller.validatePassword(value),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                          autofocus: true,
                          obscureText: true,
                          decoration: InputDecoration(labelText: 'Senha'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: TextFormField(
                          validator: (value) =>
                              controller.validateCheckPass(value),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration:
                              InputDecoration(labelText: 'Repita  a senha'),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

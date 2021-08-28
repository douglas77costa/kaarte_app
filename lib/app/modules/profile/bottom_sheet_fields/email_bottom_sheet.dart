import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/modules/profile/componentes/appbar_bottom_sheet.dart';


import '../profile_controller.dart';

class EmailBottomSheet extends GetView<ProfileController> {
  EmailBottomSheet({Key? key}) : super(key: key);

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
                controller.updateEmail();
              },
            ),
            Divider(),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: controller.formEmailKey,
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      validator: (value) => controller.validateEmail(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialValue: controller.user?.email ?? "",
                      keyboardType: TextInputType.emailAddress,
                      autofocus: true,
                      decoration: InputDecoration(labelText: 'Email'),
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

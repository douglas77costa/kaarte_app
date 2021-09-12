import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/modules/profile/components/appbar_bottom_sheet.dart';
import 'package:kaarte_app/app/modules/profile/profile_controller.dart';

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
            Divider(),
          ],
        ),
      ),
    );
  }
}

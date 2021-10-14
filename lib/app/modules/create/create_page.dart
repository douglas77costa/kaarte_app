import 'dart:io';
import 'dart:ui';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/modules/create/components/bottom_sheet_picker_image.dart';
import 'package:kaarte_app/app/shared/components/custom_dialog/custom_dialog.dart';
import 'package:kaarte_app/app/shared/constants/constants.dart';
import 'package:kaarte_app/app/theme/colors.dart';

import 'create_controller.dart';

class CreatePage extends GetView<CreateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(FluentIcons.dismiss_24_filled),
          color: ColorsApp.redDanger,
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog(
                  title: "LIMPAR OS DADOS?",
                  descriptions:
                      "Você está prestes a limpar todos os dados do formuário. Deseja continuar?",
                  type: DialogType.WARNING,
                  okText: "Limpar",
                  cancelText: "Não",
                  cancelOnPressed: () => Get.back(),
                  okOnPressed: () {
                    controller.cleanDataForm();
                    Get.back();
                  },
                );
              }),
        ),
        title: Text(
          "ADICIONAR NOVO QUADRO".capitalizeFirst!,
          style: TextStyle(color: ColorsApp.primary, fontSize: 22),
        ),
        actions: [
          IconButton(
            icon: Icon(FluentIcons.checkmark_24_filled),
            color: Colors.green,
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(
                      title: "SALVAR QUADRO?",
                      descriptions:
                          "Você está prestes a salvar um novo quadro. Deseja continuar?",
                      type: DialogType.WARNING,
                      okText: "Salvar",
                      cancelText: "Não",
                      cancelOnPressed: () => Get.back(),
                      okOnPressed: () {
                        Get.back();
                        controller.saveProduct();
                      },
                    );
                  });
            },
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 12, bottom: 12),
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(
                      'assets/images/bg_small.png',
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Center(
                  child: Obx(() {
                    return InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        _showPicker(context);
                      },
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            controller.image == Constants.NEW_IMAGE_PATH
                                ? Image.asset(
                                    controller.image,
                                    scale: 3,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: controller.image ==
                                            Constants.NEW_IMAGE_PATH
                                        ? Image.asset(
                                            controller.image,
                                            scale: 5,
                                          )
                                        : Image.file(File(controller.image)),
                                  ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        controller: controller.textCod,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Código do item',
                          suffixIcon: Icon(
                            FluentIcons.database_24_regular,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: TextFormField(
                        validator: (value) => controller.validateName(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Nome do item',
                          suffixIcon: Icon(
                            FluentIcons.notepad_24_regular,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: TextFormField(
                        initialValue: "0,00",
                        validator: (value) => controller.validatePrice(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RealInputFormatter(centavos: true, moeda: true)
                        ],
                        decoration: InputDecoration(
                          labelText: 'Preço',
                          suffixIcon: Icon(
                            FluentIcons.money_24_regular,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40, bottom: 30),
                      child: TextFormField(
                        validator: (value) =>
                            controller.validateDescription(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Descrição',
                          suffixIcon: Icon(
                            FluentIcons.text_bullet_list_square_edit_24_regular,
                          ),
                        ),
                        maxLines: 4,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return BottomSheetPickerImage();
        });
  }
}

import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaarte_app/app/data/model/products_model/products_model.dart';
import 'package:kaarte_app/app/data/repository/id_repository.dart';
import 'package:kaarte_app/app/data/repository/products_repository.dart';
import 'package:kaarte_app/app/shared/components/custom_snackbar/custom_snackbar.dart';
import 'package:kaarte_app/app/shared/constants/constants.dart';
import 'package:kaarte_app/app/theme/colors.dart';
import 'package:kaarte_app/app/utils/util.dart';

class CreateController extends GetxController {
  final _image = Constants.NEW_IMAGE_PATH.obs;
  get image => this._image.value;
  set image(value) => this._image.value = value;

  int idProd = 0;
  String? name;
  double? price;
  String? description;
  String? nameImage;
  String? pathImage;

  var file = File("");
  TextEditingController textCod = TextEditingController(text: "");
  final formKey = GlobalKey<FormState>();

  @override
  void onReady() {
    cleanDataForm();
    super.onReady();
  }

  void cleanDataForm() async {
    name = "";
    price = 0.0;
    description = "";
    nameImage = "";
    pathImage = "";
    file = File("");
    image = Constants.NEW_IMAGE_PATH;
    formKey.currentState?.reset();
    await getIdProduct();
  }

  Future<void> getIdProduct() async {
    idProd = await IdRepository.getIDProducts();
    textCod.text = idProd.toString();
  }

  void saveProduct() async {
    if (formKey.currentState!.validate() && validateImage()) {
      if(await Util.isConnected(Get.context!)){
        try {
          Util.showLoad();
          await uploadFile();
          await ProductsRepository.saveProducts(ProductsModel(
              cod: idProd,
              description: description,
              name: name,
              nameImage: nameImage,
              pathImage: pathImage,
              price: price));
          await IdRepository.incrementId(idProd);
          await 1.delay();

          cleanDataForm();
          CustomSnackbar.showTopSnackbar("Produto salvos com sucesso!", Get.context!,
              title: "Tudo certo!", type: SnackType.SUCCESS);
          Util.hideLoad();
        } on FirebaseException catch (e) {
          Util.hideLoad();
          CustomSnackbar.showTopSnackbar(
              "Erro ao salvar produto: ${e.message}", Get.context!,
              type: SnackType.WARNING);
        }
      }
    }
  }

  Future uploadFile() async {
    if (file.path.isNotEmpty) {
      var nameImageCode = 'products_images/image_code_$idProd';
      var storageReference =
          FirebaseStorage.instance.ref().child(nameImageCode);
      UploadTask uploadTask = storageReference.putFile(file);
      await uploadTask;
      pathImage = await storageReference.getDownloadURL();
      nameImage = nameImageCode;
    }
  }

  void imgFromCamera() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    await cropImage(File(pickedFile!.path)).then((value) {
      if (value != null) {
        file = value;
        image = value.path;
      }
    });
  }

  void imgFromGallery() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    await cropImage(File(pickedFile!.path)).then((value) {
      if (value != null) {
        file = value;
        image = value.path;
      }
    });
  }

  Future<File?> cropImage(File pickedImage) async {
    File? croppedFile = await ImageCropper.cropImage(
      sourcePath: pickedImage.path,
      aspectRatioPresets: Platform.isAndroid
          ? [CropAspectRatioPreset.ratio16x9]
          : [CropAspectRatioPreset.ratio16x9],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cortar Imagem',
          toolbarColor: ColorsApp.primary,
          toolbarWidgetColor: Colors.white,
          activeControlsWidgetColor: ColorsApp.accent,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
    );
    return croppedFile;
  }

  bool validateImage() {
    if (file.path != null && file.path.isNotEmpty) {
      return true;
    } else {
      CustomSnackbar.showTopSnackbar(
          "Adicione uma imagem antes de continuar", Get.context!,
          type: SnackType.WARNING);
      return false;
    }
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "O nome do item não pode ser vazio!";
    }
    name = value;
    return null;
  }

  String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return "O preço do item não pode ser vazio!";
    }
    price = UtilBrasilFields.converterMoedaParaDouble(value);
    return null;
  }

  String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return "A descrição do item não pode ser vazia!";
    }
    description = value;
    return null;
  }
}

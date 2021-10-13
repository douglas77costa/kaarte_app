import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaarte_app/app/shared/components/custom_button/rounded_custom_button.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 90),
            width: 330,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 330,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: TextFormField(
                      validator: (value) => controller.validateEmail(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        suffixIcon: Icon(
                          FluentIcons.person_48_regular,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: TextFormField(
                      validator: (value) => controller.validatePassword(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        suffixIcon: Icon(
                          FluentIcons.eye_show_24_regular,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: RoundedCustomButton(
                      isSolid: true,
                      color: Colors.white,
                      text: "ENTRAR",
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        controller.loginUser(formKey, context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

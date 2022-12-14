import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/provider/auth.dart';
import 'package:keramik/routes.dart';
import 'package:keramik/ui/user/main_menu_page.dart';
import 'package:keramik/ui/widget/button_rounded.dart';
import 'package:keramik/ui/widget/input_field_rounded.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:download_assets/download_assets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var email = null;
    var password = null;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.generalBackgroundColor.withOpacity(0.5),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    margin: EdgeInsets.only(top: 50, bottom: 20),
                    child: SvgPicture.asset(
                      "images/share.svg",
                      width: 300,
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    margin: EdgeInsets.only(top: 30, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Masuk",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InputFieldRounded(
                          label: "Email",
                          hint: "Email",
                          onChange: (val) {
                            email = val;
                          },
                          secureText: false,
                        ),
                        InputFieldRounded(
                          label: "Password",
                          hint: "Password",
                          suffixIcon: Icon(
                            Icons.remove_red_eye_outlined,
                            color: ColorPalette.generalPrimaryColor,
                          ),
                          onChange: (val) {
                            password = val;
                          },
                          secureText: true,
                        ),
                        ButtonRounded(
                          text: "Masuk",
                          onPressed: () {
                            doLogin(context, email, password);
                          },
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Belum punya akun? ",
                              style: TextStyle(fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.register);
                              },
                              child: Text(
                                "Daftar",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: ColorPalette.generalPrimaryColor),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  doLogin(BuildContext context, String email, String password) async {
    EasyLoading.show(status: 'loading...');
    var result =
    await Provider.of<AuthProvider>(context, listen: false).doSignIn(
      email: email,
      password: password,
    );
    result.fold((l) {
      EasyLoading.dismiss();
      Alert(
        context: context,
        type: AlertType.error,
        title: "Error Login",
        desc: "Password atau email yang anda masukan salah",
        buttons: [
          DialogButton(
            child: Text(
              "Close",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: ColorPalette.generalPrimaryColor,
            radius: BorderRadius.circular(0.0),
          ),
        ],
      ).show();
    }, (r) {
      EasyLoading.dismiss();
      Get.offAllNamed(
        Routes.navigator,
      );
    });
  }

}

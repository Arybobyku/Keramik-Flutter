import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/helper/constants.dart';
import 'package:keramik/local_storage_service.dart';
import 'package:keramik/model/user_model.dart';
import 'package:keramik/provider/auth.dart';
import 'package:keramik/routes.dart';
import 'package:keramik/setup_locator.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  @override
  Widget build(BuildContext context) {
    navigated(context);
    return Scaffold(
      backgroundColor: ColorPalette.generalBackgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'images/loading.json',
            ),
          ],
        ),
      ),
    );
  }

  navigated(BuildContext context) async {
    var storageService = locator<LocalStorageService>();
    var role = storageService.getIntFromPref(Constants.role);
    String? userJson = storageService.getStringFromPref(Constants.userModel);

    var user = await FirebaseAuth.instance.currentUser??null;

    await Future.delayed(const Duration(seconds: 2), () async {
      if (user==null) {
        Get.offAllNamed(Routes.login);
      } else if(role==1){
        UserModel userModel = UserModel.fromjson(jsonDecode(userJson!), user.uid);
        Provider.of<AuthProvider>(context,listen: false).setUserModelFromPref(userModel);
        Get.offAllNamed(Routes.adminInfo);
      }else{
        UserModel? userModel = UserModel.fromjson(jsonDecode(userJson!), user.uid);
        Provider.of<AuthProvider>(context,listen: false).setUserModelFromPref(userModel);
        Get.offAllNamed(Routes.mainMenu);
      }
    });
  }
}

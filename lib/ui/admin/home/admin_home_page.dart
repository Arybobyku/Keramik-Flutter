import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/provider/admin.dart';
import 'package:keramik/provider/auth.dart';
import 'package:keramik/provider/keramik.dart';
import 'package:keramik/routes.dart';
import 'package:keramik/ui/widget/horizontal_icon_label.dart';
import 'package:keramik/ui/widget/search_bar.dart';
import 'package:keramik/ui/widget/status_peminjaman.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../widget/small_button.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  bool getData = true;
  int selectedIndex = Get.arguments ?? 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AdminProvider>(builder: (context, valueAdmin, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorPalette.generalBackgroundColor,
            title: Text(
              "Keramik",
              style: TextStyle(color: ColorPalette.generalPrimaryColor),
            ),
          ),
          backgroundColor: ColorPalette.generalBackgroundColor,
          body:  SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15),
              ],
            ),
          ),
        );
      }),
    );
  }

}

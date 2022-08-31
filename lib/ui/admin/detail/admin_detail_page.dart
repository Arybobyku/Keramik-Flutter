import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/helper/constants.dart';
import 'package:keramik/provider/admin.dart';
import 'package:keramik/routes.dart';
import 'package:keramik/ui/widget/button_rounded.dart';
import 'package:keramik/ui/widget/horizontal_keramik.dart';
import 'package:keramik/ui/widget/status_container.dart';
import 'package:keramik/ui/widget/vertical_title_value.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AdminDetailPage extends StatefulWidget {
  const AdminDetailPage({Key? key}) : super(key: key);

  @override
  _AdminDetailPageState createState() => _AdminDetailPageState();
}

class _AdminDetailPageState extends State<AdminDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AdminProvider>(builder: (context, valueAdmin, _) {
        return Scaffold(
          backgroundColor: ColorPalette.generalBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

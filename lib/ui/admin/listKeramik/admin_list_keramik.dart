import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/provider/keramik.dart';
import 'package:keramik/routes.dart';
import 'package:keramik/ui/widget/horizontal_keramik.dart';
import 'package:provider/provider.dart';

class AdminListKeramikPage extends StatelessWidget {
  const AdminListKeramikPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalette.generalBackgroundColor,
          title: Text(
            "List Keramik",
            style: TextStyle(color: ColorPalette.generalPrimaryColor),
          ),
        ),
        body: Consumer<KeramikProvider>(builder: (context, valueKeramik, _) {
          return Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            child: ListView.builder(
              itemCount: valueKeramik.listKeramik.length,
              itemBuilder: (context,index) {
                var keramik = valueKeramik.listKeramik[index];
                return GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.detailKeramikGeneral,arguments: keramik);
                  },
                  child: Column(
                    children: [
                        SizedBox(height: 20),
                      HorizontalKeramik(keramikModel: keramik),
                    ],
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

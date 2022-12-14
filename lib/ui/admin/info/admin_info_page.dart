import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/provider/admin.dart';
import 'package:keramik/provider/auth.dart';
import 'package:keramik/provider/keramik.dart';
import 'package:keramik/provider/kriteria.dart';
import 'package:keramik/routes.dart';
import 'package:keramik/ui/widget/box_info.dart';
import 'package:keramik/ui/widget/horizontal_icon_label.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AdminInfoPage extends StatefulWidget {
  const AdminInfoPage({Key? key}) : super(key: key);

  @override
  State<AdminInfoPage> createState() => _AdminInfoPageState();
}

class _AdminInfoPageState extends State<AdminInfoPage> {
  bool getData = true;
  int selectedIndex = Get.arguments ?? 0;

  @override
  void initState() {
    if (getData) {
      // EasyLoading.show(status: "Loading");
      Provider.of<AdminProvider>(context, listen: false).getAllUser();
      Provider.of<KriteriaProvider>(context, listen: false).doGetAllKriteria();
      Provider.of<KriteriaProvider>(context, listen: false).doGetSubKriteriaRuang();
      Provider.of<KeramikProvider>(context, listen: false).doGetAllKeramik();
      getData = false;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Consumer<AuthProvider>(
          builder: (context,valueAuth,_) {
            return Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                      decoration: BoxDecoration(
                        color: ColorPalette.generalPrimaryColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.person,size: 80,color: Colors.white,),
                          Text(valueAuth.user.namaLengkap,style: TextStyle(fontSize: 14,color: Colors.white),),
                          SizedBox(height: 4),
                          Text(valueAuth.user.email,style: TextStyle(fontSize: 14,color: Colors.white),),
                          SizedBox(height: 4),
                        ],
                      )
                  ),
                  HorizontalIconLabel(
                    icon: Icons.person,
                    label: "User",
                    ontap: (){
                      Get.toNamed(Routes.adminCheckUser);
                    },
                  ),
                  HorizontalIconLabel(
                    icon: Icons.book,
                    label: "Tambah Keramik",
                    ontap: (){
                      Get.toNamed(Routes.adminTambahKeramik);
                    },
                  ),
                  HorizontalIconLabel(
                    icon: Icons.subject,
                    label: "Tambah Sub Kriteria",
                    ontap: (){
                      Get.toNamed(Routes.adminTambahKeramik);
                    },
                  ),
                  SizedBox(height: 10,),
                  Divider(height: 1,color: ColorPalette.generalGrey,),
                  HorizontalIconLabel(
                    icon: Icons.logout,
                    label: "Keluar",
                    color: Colors.red,
                    ontap: (){
                      doSignOut(context);
                    },
                  ),
                ],
              ),
            );
          }
        ),
        appBar: AppBar(
          title: Text("Beranda",style: TextStyle(color: ColorPalette.generalPrimaryColor),),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Consumer3<KeramikProvider, AdminProvider,KriteriaProvider>(
            builder: (context, valuKeramik, valueAdmin, valueKriteria,_) {
                return RefreshIndicator(
                onRefresh: ()async{
                  Provider.of<AdminProvider>(context, listen: false).getAllUser();
                  Provider.of<KriteriaProvider>(context, listen: false).doGetAllKriteria();
                  Provider.of<KriteriaProvider>(context, listen: false).doGetSubKriteriaRuang();
                  Provider.of<KeramikProvider>(context, listen: false).doGetAllKeramik();
                return;
                },
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child:BoxInfo(
                                    title: "Jumlah Keramik",
                                    value: valuKeramik.listKeramik.length.toString(),
                                    onTap: ()=> Get.toNamed(Routes.adminListKeramik),
                                  )
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                  child:BoxInfo(
                                    title: "Jumlah User",
                                    value: valueAdmin.listAnggota.length.toString(),
                                    backgroundColor: ColorPalette.generalSoftGrey,
                                    onTap:()=> Get.toNamed(Routes.adminCheckUser),
                                  )
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child:BoxInfo(
                                    title: "Jumlah Kriteria",
                                    value: valueKriteria.listKriteria.length.toString(),
                                    backgroundColor: ColorPalette.generalSoftPurple,
                                    onTap: (){
                                    Get.toNamed(Routes.adminKriteria);
                                    },
                                  )
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                  child:SizedBox(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  doSignOut(BuildContext context) async {
    EasyLoading.show(status: "Loading...");
    var result =
    await Provider.of<AuthProvider>(context, listen: false).doSignOut();
    result.fold((l) {
      EasyLoading.dismiss();
      Alert(
        context: context,
        type: AlertType.error,
        title: "Error",
        desc: l,
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
      Get.offAllNamed(Routes.login);
    });
  }
}


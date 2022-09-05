import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/helper/constants.dart';
import 'package:keramik/model/keramik_model.dart';
import 'package:keramik/provider/keramik.dart';
import 'package:keramik/provider/kriteria.dart';
import 'package:keramik/ui/widget/button_picker.dart';
import 'package:keramik/ui/widget/button_rounded.dart';
import 'package:keramik/ui/widget/dropdown_container.dart';
import 'package:keramik/ui/widget/input_field_rounded.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AdminTambahKeramikPage extends StatefulWidget {
  const AdminTambahKeramikPage({Key? key}) : super(key: key);

  @override
  _AdminTambahKeramilPageState createState() => _AdminTambahKeramilPageState();
}

class _AdminTambahKeramilPageState extends State<AdminTambahKeramikPage> {
  File? imageCoverFile = null;

  String? nama = null;

  //ruang
  int? ruangTamu = null;
  int? ruangDapur = null;
  int? ruangKamarMandi = null;
  int? ruangTeras = null;

  //luas
  int? luasKecil = null;
  int? luasSedang = null;
  int? luasBesar = null;
  int? luasSangatBesar = null;

  ///harga
  int? harga = null;

  ///kualitas
  int? KW1 = null;
  int? KW2 = null;
  int? KW3 = null;

  ///tekstur
  int? teksturMatte = null;
  int? teksturGlossy = null;

  ///Motif
  int? motifSederhana = null;
  int? motifBiasa = null;
  int? motifRumit = null;

  String? deskripsi = null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Tambah Keramik",
            style: TextStyle(color: ColorPalette.generalPrimaryColor),
          ),
        ),
        backgroundColor: ColorPalette.generalBackgroundColor,
        body: Consumer<KriteriaProvider>(builder: (context, valueKriteria, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  InputFieldRounded(
                    label: "Nama",
                    hint: "Nama",
                    onChange: (val) {
                      nama = val;
                    },
                    secureText: false,
                  ),

                  ///Ruang
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Ruang",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputFieldRounded(
                              label: "Ruang Tamu",
                              hint:  "Ruang Tamu",
                              keyboardType: TextInputType.number,
                              onChange: (val) {
                                ruangTamu = int.parse(val);
                              },
                              secureText: false,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: InputFieldRounded(
                              label: "Ruang Dapur",
                              hint: "Ruang Dapur",
                              keyboardType: TextInputType.number,
                              onChange: (val) {
                                ruangDapur = int.parse(val);
                              },
                              secureText: false,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputFieldRounded(
                              label: "Kamar Mandi",
                              hint: "Kamar Mandi",
                              keyboardType: TextInputType.number,
                              onChange: (val) {
                                ruangKamarMandi = int.parse(val);
                              },
                              secureText: false,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: InputFieldRounded(
                              label: "Ruang Teras",
                              hint: "Ruang Teras",
                              keyboardType: TextInputType.number,
                              onChange: (val) {
                                ruangTeras = int.parse(val);
                              },
                              secureText: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  ///Luas
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Luas",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputFieldRounded(
                              label: "Kecil",
                              hint: "Kecil",
                              keyboardType: TextInputType.number,
                              onChange: (val) {
                                luasKecil = int.parse(val);
                              },
                              secureText: false,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: InputFieldRounded(
                              label: "Sedang",
                              hint: "Sedang",
                              keyboardType: TextInputType.number,
                              onChange: (val) {
                                luasSedang = int.parse(val);
                              },
                              secureText: false,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputFieldRounded(
                              label: "Besar",
                              hint: "Besar",
                              keyboardType: TextInputType.number,
                              onChange: (val) {
                                luasBesar = int.parse(val);
                              },
                              secureText: false,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: InputFieldRounded(
                              label: "Sangat Besar",
                              hint: "Sangat Besar",
                              keyboardType: TextInputType.number,
                              onChange: (val) {
                                luasSangatBesar = int.parse(val);
                              },
                              secureText: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// Harga
                  SizedBox(height: 10),
                  Text(
                    "Harga",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  InputFieldRounded(
                    label: "Harga",
                    hint: "Harga",
                    keyboardType: TextInputType.number,
                    onChange: (val) {
                      harga = int.parse(val);
                    },
                    secureText: false,
                  ),

                  ///Kualitas
                  SizedBox(height: 10),
                  Text(
                    "Kualitas",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputFieldRounded(
                          label: "KW3",
                          hint: "KW3",
                          keyboardType: TextInputType.number,
                          onChange: (val) {
                            KW3 = int.parse(val);
                          },
                          secureText: false,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InputFieldRounded(
                          label: "KW2",
                          hint: "KW2",
                          keyboardType: TextInputType.number,
                          onChange: (val) {
                            KW2 = int.parse(val);
                          },
                          secureText: false,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InputFieldRounded(
                          label: "KW1",
                          hint: "KW1",
                          keyboardType: TextInputType.number,
                          onChange: (val) {
                            KW1 = int.parse(val);
                          },
                          secureText: false,
                        ),
                      ),
                    ],
                  ),

                  ///tekstur
                  SizedBox(height: 10),
                  Text(
                    "Tekstur",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputFieldRounded(
                          label: "Matte/Rustic/Unpolished",
                          hint: "Matte/Rustic/Unpolished",
                          keyboardType: TextInputType.number,
                          onChange: (val) {
                            teksturMatte = int.parse(val);
                          },
                          secureText: false,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InputFieldRounded(
                          label: "Glossy/Polished",
                          hint: "Glossy/Polished",
                          keyboardType: TextInputType.number,
                          onChange: (val) {
                            teksturGlossy = int.parse(val);
                          },
                          secureText: false,
                        ),
                      ),
                    ],
                  ),

                  ///motif
                  SizedBox(height: 10),
                  Text(
                    "Motif",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputFieldRounded(
                          label: "Sederhana",
                          hint: "Sederhana",
                          keyboardType: TextInputType.number,
                          onChange: (val) {
                            motifSederhana = int.parse(val);
                          },
                          secureText: false,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InputFieldRounded(
                          label: "Biasa",
                          hint: "Biasa",
                          keyboardType: TextInputType.number,
                          onChange: (val) {
                            motifBiasa = int.parse(val);
                          },
                          secureText: false,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InputFieldRounded(
                          label: "Rumit",
                          hint: "Rumit",
                          keyboardType: TextInputType.number,
                          onChange: (val) {
                            motifRumit = int.parse(val);
                          },
                          secureText: false,
                        ),
                      ),
                    ],
                  ),

                  ///deskripsi
                  InputFieldRounded(
                    label: "Deskripsi",
                    hint: "Deskripsi",
                    onChange: (val) {
                      deskripsi = val;
                    },
                    secureText: false,
                  ),
                  imageCoverFile != null
                      ? Container(
                          margin: EdgeInsets.only(top: 15, bottom: 30),
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(imageCoverFile!),
                            ),
                          ),
                        )
                      : ButtonPicker(
                          onTap: () => doImagePicker(),
                        ),
                  ButtonRounded(
                    text: "Tambah",
                    onPressed: () => doTambahKeramik(),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  doImagePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result != null) {
      setState(() {
        imageCoverFile = File(result.files.single.path!);
      });
    } else {
      // User canceled the picker
    }
  }

  doTambahKeramik() async {
    if (nama != null &&
        ruangTeras != null &&
        ruangKamarMandi != null &&
        ruangDapur != null &&
        ruangTamu != null &&
        luasSangatBesar != null &&
        luasBesar != null &&
        luasSedang != null &&
        luasKecil != null &&
        harga != null &&
        KW3 != null &&
        KW2 != null &&
        KW1 != null &&
        teksturMatte != null &&
        teksturGlossy != null &&
        motifRumit != null &&
        motifBiasa != null &&
        motifSederhana != null &&
        deskripsi != null) {
      var keramik = KeramikModel(
        nama: nama,
        deskripsi: deskripsi,
        harga: harga,
        ruangTeras: ruangTeras,
        ruangKamarMandi: ruangKamarMandi,
        ruangDapur: ruangDapur,
        ruangTamu: ruangTamu,
        luasSangatBesar: luasSangatBesar,
        luasBesar: luasBesar,
        luasSedang: luasSedang,
        luasKecil: luasKecil,
        KW3: KW3,
        KW2: KW2,
        KW1: KW1,
        teksturMatte: teksturMatte,
        teksturGlossy: teksturGlossy,
        motifRumit: motifRumit,
        motifBiasa: motifBiasa,
        motifSederhana: motifSederhana,
      );

      EasyLoading.show(status: "Loading");

      var result = await Provider.of<KeramikProvider>(context, listen: false)
          .doTambahKeramik(keramikModel: keramik, coverGambar: imageCoverFile);

      result.fold((l) {
        EasyLoading.dismiss();
        Alert(
          context: context,
          type: AlertType.error,
          title: "Gagal menambahkan keramik",
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
        Get.back();
      });
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Gagal menambahkan keramik",
        desc: "Harap isi seluruh form",
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
    }
  }
}

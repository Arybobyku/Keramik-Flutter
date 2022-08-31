import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/model/keramik_model.dart';
import 'package:keramik/provider/keramik.dart';
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
  String? ruang = null;
  String? bobotRuang = null;
  String? nama = null;
  double? luas = null;
  String? bobotLuas= null;
  double? harga = null;
  String? kualitas = null;
  String? bobotKualitas = null;
  String? tekstur = null;
  String? bobotTekstur = null;
  String? motif = null;
  String? bobotMotif = null;
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                Row(
                  children: [
                    Expanded(
                      child: InputFieldRounded(
                        label: "Ruang",
                        hint: "Ruang",
                        onChange: (val) {
                          ruang = val;
                        },
                        secureText: false,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: DropdownContainer(
                        value: bobotRuang,
                        onChanged: (val) {
                          setState(() {
                            bobotRuang = val;
                          });
                        },
                        items: [
                          "Sangat Baik",
                          "Baik",
                          "Biasa",
                          "Kurang",
                          "Sangat Kurang"
                        ],
                        hint: 'Bobot Ruang',
                      ),
                    )
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: InputFieldRounded(
                        label: "Luas",
                        hint: "Luas",
                        onChange: (val) {
                          luas = double.parse(val);
                        },
                        secureText: false,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: DropdownContainer(
                        value: bobotLuas,
                        onChanged: (val) {
                          setState(() {
                            bobotLuas = val;
                          });
                        },
                        items: [
                          "Sangat Baik",
                          "Baik",
                          "Biasa",
                          "Kurang",
                          "Sangat Kurang"
                        ],
                        hint: 'Bobot Luas',
                      ),
                    )
                  ],
                ),
                InputFieldRounded(
                  label: "Harga",
                  hint: "Harga",
                  onChange: (val) {
                    harga = double.parse(val);
                  },
                  secureText: false,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InputFieldRounded(
                        label: "Kualitas",
                        hint: "Kualitas",
                        onChange: (val) {
                          kualitas = val;
                        },
                        secureText: false,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: DropdownContainer(
                        value: bobotKualitas,
                        onChanged: (val) {
                          setState(() {
                            bobotKualitas = val;
                          });
                        },
                        items: [
                          "Sangat Baik",
                          "Baik",
                          "Biasa",
                          "Kurang",
                          "Sangat Kurang"
                        ],
                        hint: 'Bobot Kualitas',
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: InputFieldRounded(
                        label: "Tekstur",
                        hint: "Tekstur",
                        onChange: (val) {
                          tekstur = val;
                        },
                        secureText: false,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: DropdownContainer(
                        value: bobotTekstur,
                        onChanged: (val) {
                          setState(() {
                            bobotTekstur = val;
                          });
                        },
                        items: [
                          "Sangat Baik",
                          "Baik",
                          "Biasa",
                          "Kurang",
                          "Sangat Kurang"
                        ],
                        hint: 'Bobot Tekstur',
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: InputFieldRounded(
                        label: "Motif",
                        hint: "Motif",
                        onChange: (val) {
                          motif = val;
                        },
                        secureText: false,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: DropdownContainer(
                        value: bobotMotif,
                        onChanged: (val) {
                          setState(() {
                            bobotMotif = val;
                          });
                        },
                        items: [
                          "Sangat Baik",
                          "Baik",
                          "Biasa",
                          "Kurang",
                          "Sangat Kurang"
                        ],
                        hint: 'Bobot Motif',
                      ),
                    )
                  ],
                ),
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
                  onPressed: () => doTambahBuku(),
                )
              ],
            ),
          ),
        ),
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

  doTambahBuku() async {
    if (imageCoverFile != null &&
        nama != null &&
        ruang != null &&
        luas != null &&
        harga != null &&
        kualitas != null &&
        tekstur != null &&
        motif != null &&
        deskripsi != null) {
      var keramik = KeramikModel(
          nama: nama,
          deskripsi: deskripsi,
          harga: harga,
          kualitas: kualitas,
          luas: luas,
          motif: motif,
          ruang: ruang,
          tekstur: tekstur);

      EasyLoading.show(status: "Loading");

      var result = await Provider.of<KeramikProvider>(context, listen: false)
          .doTambahKeramik(keramikModel: keramik, coverGambar: imageCoverFile);

      result.fold((l) {
        EasyLoading.dismiss();
        Alert(
          context: context,
          type: AlertType.error,
          title: "Gagal menambahkan buku",
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
        title: "Gagal menambahkan buku",
        desc: "Harap isi seluruh formulir",
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

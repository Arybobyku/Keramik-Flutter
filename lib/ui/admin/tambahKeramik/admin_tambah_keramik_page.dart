import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/model/buku_model.dart';
import 'package:keramik/model/keramik_model.dart';
import 'package:keramik/provider/keramik.dart';
import 'package:keramik/ui/widget/button_picker.dart';
import 'package:keramik/ui/widget/button_rounded.dart';
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
  String? nama = null;
  double? luas = null;
  double? harga = null;
  String? kualitas = null;
  String? tekstur = null;
  String? motif = null;
  String? deskripsi = null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Tambah Keramik",
            style: TextStyle(color: ColorPalette.generalPrimaryColor),
          ),
        ),
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
                ),                InputFieldRounded(
                  label: "Ruang",
                  hint: "Ruang",
                  onChange: (val) {
                    ruang = val;
                  },
                  secureText: false,
                ),
                InputFieldRounded(
                  label: "Luas",
                  hint: "Luas",
                  onChange: (val) {
                    luas = double.parse(val);
                  },
                  secureText: false,
                ),
                InputFieldRounded(
                  label: "Harga",
                  hint: "Harga",
                  onChange: (val) {
                    harga = double.parse(val);
                  },
                  secureText: false,
                ),
                InputFieldRounded(
                  label: "Kualitas",
                  hint: "Kualitas",
                  onChange: (val) {
                    kualitas = val;
                  },
                  secureText: false,
                ),
                InputFieldRounded(
                  label: "Tekstur",
                  hint: "Tekstur",
                  onChange: (val) {
                    tekstur = val;
                  },
                  secureText: false,
                ),
                InputFieldRounded(
                  label: "Motif",
                  hint: "Motif",
                  onChange: (val) {
                    motif = val;
                  },
                  secureText: false,
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
        tekstur: tekstur
      );

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
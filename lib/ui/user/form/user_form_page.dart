import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/helper/constants.dart';
import 'package:keramik/provider/keramik.dart';
import 'package:keramik/provider/kriteria.dart';
import 'package:keramik/routes.dart';
import 'package:keramik/ui/widget/button_rounded.dart';
import 'package:keramik/ui/widget/dropdown_container.dart';
import 'package:keramik/ui/widget/input_field_rounded.dart';
import 'package:provider/provider.dart';

class UserFormPage extends StatefulWidget {
  const UserFormPage({Key? key}) : super(key: key);

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {

  String? jenisRuang = null;
  String? jenisLuas = null;
  String? jenisKualitas = null;
  String? jenisTekstur = null;
  String? jenisMotif = null;
  int? harga = null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Rekomendasi Pemilihan Keramik",
          style: TextStyle(color: ColorPalette.generalPrimaryColor),
        ),
      ),
      backgroundColor: ColorPalette.generalBackgroundColor,
      body: SafeArea(
        child: Consumer2<KriteriaProvider,KeramikProvider>(
          builder: (context,valueKriteria,valueKeramik,_) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    DropdownContainer(
                      value: jenisRuang,
                      onChanged: (val) {
                        setState(() {
                          jenisRuang = val;
                        });
                      },
                      items: [
                        "Lantai Ruang Tamu",
                        "Lantai Dapur",
                        "Lantai Kamar Mandi",
                        "Lantai Teras",
                      ],
                      hint: 'Jenis Ruang',
                    ),
                    DropdownContainer(
                      value: jenisLuas,
                      onChanged: (val) {
                        setState(() {
                          jenisLuas = val;
                        });
                      },
                      items: [
                        "Kecil",
                        "Sedang",
                        "Besar",
                        "Sangat Besar",
                      ],
                      hint: 'Jenis Luas',
                    ),
                    DropdownContainer(
                      value: jenisKualitas,
                      onChanged: (val) {
                        setState(() {
                          jenisKualitas = val;
                        });
                      },
                      items: [
                        "KW1",
                        "KW2",
                        "KW3",
                      ],
                      hint: 'Jenis Kualitas',
                    ),
                    DropdownContainer(
                      value: jenisTekstur,
                      onChanged: (val) {
                        setState(() {
                          jenisTekstur = val;
                        });
                      },
                      items: [
                        "Matte/Rustic/Unpolished",
                        "Glossy/Polished",
                      ],
                      hint: 'Jenis Tekstur',
                    ),
                    DropdownContainer(
                      value: jenisMotif,
                      onChanged: (val) {
                        setState(() {
                          jenisMotif = val;
                        });
                      },
                      items: [
                        "Sederhana",
                        "Biasa",
                        "Rumit",
                      ],
                      hint: 'Jenis Motif',
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
                    ButtonRounded(
                      text: "Pilih",
                      onPressed: ()async{
                     var result = await   valueKeramik.doRekomendasiKeramik(
                            mapRuangDropdown(jenisRuang!)!,
                            mapLuasDropdown(jenisLuas!)!,
                            mapKualitasDropdown(jenisKualitas!)!,
                            mapTeksturDropdown(jenisTekstur!)!,
                            mapMotifDropdown(jenisMotif!)!,
                            valueKriteria.listKriteria);

                     Get.toNamed(Routes.hasil,arguments: result);

                      },
                    )
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }

}

import 'package:flutter/material.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:intl/intl.dart';
import 'package:keramik/model/keramik_model.dart';

class Constants{
  static const String userName = 'userName';
  static const String role = 'role';
  static const String userModel = 'userModel';
  static const String notifikasiPengembalian = 'notifikasiPengembalian';
}

String parseDate(String dateString) {
  var parsedDate = DateTime.parse(dateString);
  return  DateFormat.yMMMMd("en_US").format(parsedDate);
}

String? mapRuangDropdown(String ruang){
  switch(ruang){
    case "Lantai Ruang Tamu":
      return "ruangTamu";
    case "Lantai Dapur":
      return "ruangDapur";
    case "Lantai Kamar Mandi":
      return "ruangKamarMandi";
    case "Lantai Teras":
      return "ruangTeras";
  }
}

String? mapLuasDropdown(String luas){
  switch(luas){
    case "Kecil":
      return "luasKecil";
    case "Sedang":
      return "luasSedang";
    case "Besar":
      return "luasBesar";
    case "Sangat Besar":
      return "luasSangatBesar";
  }
}

String? mapKualitasDropdown(String kualitas){
  switch(kualitas){
    case "KW1":
      return "KW1";
    case "KW2":
      return "KW2";
    case "KW3":
      return "KW3";
  }
}

String? mapTeksturDropdown(String tekstur){
  switch(tekstur){
    case "Matte/Rustic/Unpolished":
      return "teksturMatte";
    case "Glossy/Polished":
      return "teksturGlossy";
  }
}

String? mapMotifDropdown(String motif){
  switch(motif){
    case "Sederhana":
      return "motifSederhana";
    case "Biasa":
      return "motifBiasa";
    case "Rumit":
      return "motifRumit";
  }
}

KeramikUserInput mapKeramikToKeramikUserInput(
    KeramikModel keramikModel,
    String jenisRuang,
    String jenisLuas,
    String jenisKualitas,
    String jenisTekstur,
    String jenisMotif,
    ){

  int? ruang;
  int? luas;
  int? harga;
  int? kualitas;
  int? tekstur;
  int? motif;

  harga = keramikModel.harga;

  switch(jenisRuang){
    case "ruangTamu":
      ruang = keramikModel.ruangTamu;
      break;
    case "ruangDapur":
      ruang = keramikModel.ruangDapur;
      break;
    case "ruangKamarMandi":
      ruang = keramikModel.ruangKamarMandi;
      break;
    case "ruangTeras":
      ruang = keramikModel.ruangTeras;
      break;
  }

  switch(jenisLuas){
    case "luasKecil":
      luas = keramikModel.luasKecil;
      break;
    case "luasSedang":
      luas = keramikModel.luasSedang;
      break;
    case "luasBesar":
      luas = keramikModel.luasBesar;
      break;
    case "luasSangatBesar":
      luas = keramikModel.luasSangatBesar;
      break;
  }

  switch(jenisKualitas){
    case "KW1":
      kualitas = keramikModel.KW1;
      break;
    case "KW2":
      kualitas = keramikModel.KW2;
      break;
    case "KW3":
      kualitas = keramikModel.KW3;
      break;
  }

  switch(jenisTekstur){
    case "teksturMatte":
      tekstur = keramikModel.teksturMatte;
      break;
    case "teksturGlossy":
      tekstur = keramikModel.teksturGlossy;
      break;
  }

  switch(jenisMotif){
    case "motifSederhana":
      motif = keramikModel.motifSederhana;
      break;
    case "motifBiasa":
      motif = keramikModel.motifBiasa;
      break;
    case "motifRumit":
      motif = keramikModel.motifRumit;
      break;
  }

  return KeramikUserInput(
      motif:motif,
      tekstur:tekstur,
      kualitas:kualitas,
      ruang:ruang,
      harga:harga,
      luas:luas,
      keramikModel: keramikModel

  );
}




final kRoundedContainer = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  border: Border.all(color: ColorPalette.generalPrimaryColor,width: 2),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 1,
      blurRadius: 7,
      offset: Offset(0, 1), // changes position of shadow
    ),
  ],
);
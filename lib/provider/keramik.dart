import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:keramik/helper/constants.dart';
import 'package:keramik/model/keramik_model.dart';
import 'package:keramik/model/kriteria_model.dart';
import 'package:keramik/service/keramik_service.dart';

class KeramikProvider extends ChangeNotifier {
  KeramikService _keramikService = KeramikService();
  List<KeramikModel> listKeramik = [];
  List<KeramikModel> searchResult = [];

  KeramikRekomendasi? rekomendasiKeramik = null;

  KeramikModel? keramikDetail = null;

  Future<Either<String, bool>> doTambahKeramik(
      {required KeramikModel keramikModel, required File? coverGambar}) async {
    try {
      var hasil = keramikModel;
      if (coverGambar != null) {
        hasil = await _keramikService.simpanGambar(keramikModel, coverGambar);
      } else {
        hasil.gambar =
            "https://firebasestorage.googleapis.com/v0/b/keramik-3a7c4.appspot.com/o/no%20cover.jpeg?alt=media&token=fbc9f0c0-55ea-4fe2-aaa2-b8cf64ad8119";
      }

      await _keramikService.setKeramik(hasil);
      return right(true);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<KeramikModel>>> doGetAllKeramik() async {
    try {
      listKeramik = [];
      var result = await _keramikService.getKeramik();
      listKeramik = result;
      notifyListeners();
      return right(result);
    } catch (e) {
      return left(e.toString());
    }
  }

  clickKeramikDetail(KeramikModel keramikModel) {
    keramikDetail = keramikModel;
    notifyListeners();
  }

  searchKeramik(String keyword) {
    searchResult = listKeramik
        .where((element) =>
            element.deskripsi!.toLowerCase().contains(keyword) ||
            element.nama!.toLowerCase().contains(keyword))
        .toList();
    notifyListeners();
  }

  Future<List<KeramikRekomendasi>> doRekomendasiKeramik(
    String jenisRuang,
    String jenisLuas,
    String jenisKualitas,
    String jenisTekstur,
    String jenisMotif,
    List<KriteriaModel> kriteria,
  ) async {
    ///map kermaik to keramikRekomendasi
    List<KeramikUserInput> filterKeramikKriteria = [];
    listKeramik.forEach((element) {
      filterKeramikKriteria.add(mapKeramikToKeramikUserInput(element,
          jenisRuang, jenisLuas, jenisKualitas, jenisTekstur, jenisMotif));
    });

    //normalisasi SAW
    List<KeramikRekomendasi> keramikRekomendasi = [];
    filterKeramikKriteria.forEach((element) {
      double? ruang;
      double? luas;
      double? harga;
      double? kualitas;
      double? tekstur;
      double? motif;

      ///benefit
      ruang = element.ruang! / 9;

      ///benefit
      luas = element.luas! / 9;

      ///cost
      harga = 55476 / element.harga!;

      ///benefit
      kualitas = element.kualitas! / 9;

      ///benefit
      tekstur = element.tekstur! / 9;

      ///benefit
      motif = element.motif! / 9;

      ///total all the value
      var total = (ruang * 20) + (luas * 20) + (harga * 20) + (kualitas * 20) +  (tekstur * 10) + (motif * 10);

      keramikRekomendasi.add(
        KeramikRekomendasi(
          motif:motif,
          tekstur:tekstur,
          kualitas:kualitas,
          ruang:ruang,
          harga:harga,
          luas:luas,
          total:total,
          keramikModel:element.keramikModel,
        )
      );

    });
    
    keramikRekomendasi.sort((a,b){
      return b.total!.compareTo(a.total!);
    });

    var index = 1;
    keramikRekomendasi.forEach((element) {
      print("$index. ${element.keramikModel!.nama} : ${element.total!}%");
      index++;
    });

    rekomendasiKeramik = keramikRekomendasi.first;
    notifyListeners();

    return keramikRekomendasi;
    
  }
}

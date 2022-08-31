import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:keramik/model/keramik_model.dart';
import 'package:keramik/service/keramik_service.dart';

class KeramikProvider extends ChangeNotifier {
  KeramikService _keramikService = KeramikService();
  List<KeramikModel> listKeramik = [];
  List<KeramikModel> searchResult = [];

  KeramikModel? keramikDetail = null;

  Future<Either<String, bool>> doTambahKeramik(
      {required KeramikModel keramikModel, required File? coverGambar}) async {
    try {
      var hasil = keramikModel;
      if(coverGambar!=null){
         hasil = await _keramikService.simpanGambar(keramikModel, coverGambar);
      }else{
        hasil.gambar = "https://firebasestorage.googleapis.com/v0/b/myperpus-a5b72.appspot.com/o/no-cover.png?alt=media&token=0095d2e4-8490-4c48-bb79-66fd72ea226c";
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

   updateBukuStatus(List<KeramikModel> id)async{
    id.forEach((buku) async{
      listKeramik[listKeramik.indexWhere((element) => element.id==buku.id)] = buku;
      notifyListeners();
    });
    notifyListeners();
  }

  clickKeramikDetail(KeramikModel keramikModel) {
    keramikDetail = keramikModel;
    notifyListeners();
  }

  searchKeramik(String keyword) {

    searchResult = listKeramik.where((element) =>
    element.deskripsi!.toLowerCase().contains(keyword) ||
    element.tekstur!.toLowerCase().contains(keyword) ||
        element.motif!.toLowerCase().contains(keyword) ||
        element.ruang!.toLowerCase().contains(keyword)
    ).toList();
    notifyListeners();
  }
}

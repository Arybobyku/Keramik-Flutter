import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:keramik/model/buku_model.dart';
import 'package:keramik/service/buku_service.dart';

class BukuProvider extends ChangeNotifier {
  BukuService _bukuService = BukuService();
  List<BukuModel> listBuku = [];
  List<BukuModel> searchResult = [];

  BukuModel? bukuDetail = null;

  Future<Either<String, bool>> doTambahBuku(
      {required BukuModel buku, required File? coverBuku}) async {
    try {
      var hasil = buku;
      if(coverBuku!=null){
         hasil = await _bukuService.simpanGambar(buku, coverBuku);
      }else{
        hasil.gambar = "https://firebasestorage.googleapis.com/v0/b/myperpus-a5b72.appspot.com/o/no-cover.png?alt=media&token=0095d2e4-8490-4c48-bb79-66fd72ea226c";
      }

      await _bukuService.setBuku(hasil);
      return right(true);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<BukuModel>>> doGetAllBook() async {
    try {
      listBuku = [];
      var result = await _bukuService.getAllBuku();
      listBuku = result;
      notifyListeners();
      return right(result);
    } catch (e) {
      return left(e.toString());
    }
  }

   updateBukuStatus(List<BukuModel> id)async{
    id.forEach((buku) async{
      buku.stok -=1 ;
      listBuku[listBuku.indexWhere((element) => element.id==buku.id)] = buku;
      notifyListeners();
    });
    notifyListeners();
  }

  clickBukuDetail(BukuModel bukuModel) {
    bukuDetail = bukuModel;
    notifyListeners();
  }

  searchBook(String keyword) {

    searchResult = listBuku.where((element) =>
    element.judul.toLowerCase().contains(keyword) ||
    element.anakJudul.toLowerCase().contains(keyword) ||
        element.pengarang.toLowerCase().contains(keyword) ||
        element.penerbit.toLowerCase().contains(keyword)
    ).toList();
    notifyListeners();
  }
}
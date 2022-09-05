import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:keramik/model/keramik_model.dart';

class KeramikService {
  final CollectionReference _keramikReference =
      FirebaseFirestore.instance.collection('Keramik');
  Reference ref = FirebaseStorage.instance.ref();

  Future<KeramikModel> simpanGambar(KeramikModel keramik, File coverFile) async {
    try {

      final metadata = SettableMetadata(
        customMetadata: {'picked-file-path': coverFile.path},
      );

      String fileName =
          "${DateTime.now().millisecond}-${DateTime.now().minute}-${DateTime.now().hour}-${DateTime.now().day}-${DateTime.now().month}-buku";
      fileName += coverFile.path.split('/').last;
      var result = await ref.child(fileName).putFile(coverFile, metadata);
      result.ref.getDownloadURL();

      String path = await result.ref.getDownloadURL();
      keramik.gambar = path;
      return keramik;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setKeramik(KeramikModel keramikModel)async{
      try{
       await  _keramikReference.doc().set({
         'nama': keramikModel.nama,
         'gambar': keramikModel.gambar,
         'deskripsi': keramikModel.deskripsi,
         'harga': keramikModel.harga,
         'ruangTamu': keramikModel.ruangTamu,
         'ruangDapur': keramikModel.ruangDapur,
         'ruangKamarMandi': keramikModel.ruangKamarMandi,
         'ruangTeras': keramikModel.ruangTeras,
         'luasKecil': keramikModel.luasKecil,
         'luasSedang': keramikModel.luasSedang,
         'luasBesar': keramikModel.luasBesar,
         'luasSangatBesar': keramikModel.luasSangatBesar,
         'KW3': keramikModel.KW3,
         'KW2': keramikModel.KW2,
         'KW1': keramikModel.KW1,
         'teksturGlossy': keramikModel.teksturGlossy,
         'teksturMatte': keramikModel.teksturMatte,
         'motifRumit': keramikModel.motifRumit,
         'motifBiasa': keramikModel.motifBiasa,
         'motifSederhana': keramikModel.motifSederhana,
        });
      }catch(e){
        rethrow;
      }
  }

  Future<List<KeramikModel>> getKeramik()async{
    try{
      print("Get Keramik From Firebase");
      QuerySnapshot result = await _keramikReference.get();
      List<KeramikModel> keramikFromFirebase = result.docs.map((e){
        return KeramikModel.fromjson(e.data() as Map<String, dynamic>, e.id);
      }).toList();

      return keramikFromFirebase;
    }catch(e){
      rethrow;
    }
  }


}

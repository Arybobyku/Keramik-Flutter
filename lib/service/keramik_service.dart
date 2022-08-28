import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:keramik/model/buku_model.dart';
import 'package:keramik/model/keramik_model.dart';

class KeramikService {
  final CollectionReference _bukuReference =
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
       await  _bukuReference.doc().set({
         'nama': keramikModel.nama,
         'gambar': keramikModel.gambar,
         'tekstur': keramikModel.tekstur,
         'ruang': keramikModel.ruang,
         'motif': keramikModel.motif,
         'luas': keramikModel.luas,
         'kualitas': keramikModel.kualitas,
         'harga': keramikModel.harga,
         'deskripsi': keramikModel.deskripsi,
        });
      }catch(e){
        rethrow;
      }
  }

  Future<List<KeramikModel>> getKeramik()async{
    try{
      print("Get Keramik From Firbase");
      QuerySnapshot result = await _bukuReference.get();
      List<KeramikModel> keramikFromFirebase = result.docs.map((e){
        return KeramikModel.fromjson(e.data() as Map<String, dynamic>, e.id);
      }).toList();

      return keramikFromFirebase;
    }catch(e){
      rethrow;
    }
  }

  Future<BukuModel> getBukuById(String id) async {
    try {
      DocumentSnapshot snapshot = await _bukuReference.doc(id).get();
      return BukuModel.fromjson(snapshot.data() as Map<String, dynamic> , id);
    } catch (e) {
      rethrow;
    }
  }

}

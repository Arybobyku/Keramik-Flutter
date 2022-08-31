import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:keramik/model/kriteria_model.dart';

class KriteriaService{
  final CollectionReference _kriteriaReference =
  FirebaseFirestore.instance.collection('kriteria');

  Reference ref = FirebaseStorage.instance.ref();

  Future<List<KriteriaModel>> getKriteria()async{
    try{
      print("Get Kriteria From Firebase");
      QuerySnapshot result = await _kriteriaReference.get();
      List<KriteriaModel> kriteriaFromFirebase = result.docs.map((e){
        return KriteriaModel.fromjson(e.data() as Map<String, dynamic>, e.id);
      }).toList();

      return kriteriaFromFirebase;
    }catch(e){
      rethrow;
    }
  }

}
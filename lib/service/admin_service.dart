import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:keramik/model/user_model.dart';

import '../helper/constants.dart';

class AdminService{
  final FirebaseAuth _auth = FirebaseAuth.instance;


  final CollectionReference _userReference =
  FirebaseFirestore.instance.collection('Users');




  Future<List<UserModel>> getAllAnggota()async{
    try{
      QuerySnapshot result = await _userReference.where("role",isEqualTo: 0).get();
      print(result.size);
      List<UserModel> listAnggota = result.docs.map((e){
        return UserModel.fromjsonWithTimeStamp(e.data() as Map<String, dynamic>, e.id);
      }).toList();
      return listAnggota;
    }catch(e){
      print(e);
      rethrow;
    }
  }

  Future<void> konfirmasiAnggota(UserModel userModel)async{
    try{
      var userById = await _userReference.doc(userModel.id);
      userById.update({
        "isValid":true
      });
    }catch(e){
      rethrow;
    }
  }

  Future<void> batalkanKonfirmasiAnggota(UserModel userModel)async{
    try{
      var userById = await _userReference.doc(userModel.id);
      userById.update({
        "isValid":false
      });
    }catch(e){
      rethrow;
    }
  }

}
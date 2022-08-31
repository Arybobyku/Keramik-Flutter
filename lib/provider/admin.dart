import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:keramik/helper/constants.dart';
import 'package:keramik/model/user_model.dart';
import 'package:keramik/service/admin_service.dart';

class AdminProvider extends ChangeNotifier {
  AdminService _adminService = AdminService();
  List<UserModel> listAnggota = [];
  List<UserModel> listAnggotaSearch = [];
  late UserModel selectedAnggota;


  Future<Either<String, List<UserModel>>> getAllUser() async {
    try {
      listAnggota = [];
      var result = await _adminService.getAllAnggota();
      listAnggota = result;
      listAnggotaSearch = result;
      notifyListeners();
      return right(result);
    } catch (e) {
      return left(e.toString());
    }
  }

  selectDetailAnggota(UserModel userModel){
    selectedAnggota = userModel;
    notifyListeners();
  }

}

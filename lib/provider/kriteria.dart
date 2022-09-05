
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:keramik/model/kriteria_model.dart';
import 'package:keramik/model/label_model.dart';
import 'package:keramik/service/kriteria_service.dart';

class KriteriaProvider extends ChangeNotifier {
  KriteriaService _kriteriaService = KriteriaService();
  List<KriteriaModel> listKriteria = [];
  List<LabelModel> listSubKriteriaRuang = [];

  Future<Either<String, List<KriteriaModel>>> doGetAllKriteria() async {
    try {
      listKriteria = [];
      var result = await _kriteriaService.getKriteria();
      listKriteria = result;
      notifyListeners();
      return right(result);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<LabelModel>>> doGetSubKriteriaRuang() async {
    try {
      listSubKriteriaRuang = [];
      var result = await _kriteriaService.getSubKriteriaRuang();
      listSubKriteriaRuang = result;
      notifyListeners();
      return right(result);
    } catch (e) {
      return left(e.toString());
    }
  }

}

class KriteriaModel {
  String? id;
  String? nama;
  int? bobot;

  KriteriaModel({this.id,this.nama, this.bobot});

  factory KriteriaModel.fromjson(Map<String, dynamic> json, String id) {
    return KriteriaModel(
      id: id,
      nama: json['nama'],
      bobot: json['bobot'],
    );
  }

  factory KriteriaModel.fromjsonWithId(Map<String, dynamic> json) {
    return KriteriaModel(
      id: json['id'],
      nama: json['nama'],
      bobot: json['bobot'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'bobot': bobot,
      };
}

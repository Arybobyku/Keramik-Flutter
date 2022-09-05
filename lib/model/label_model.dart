class LabelModel{
  String? id;
  String? nama;
  LabelModel({this.nama,this.id});

  factory LabelModel.fromjson(Map<String, dynamic> json, String id) {
    return LabelModel(
      id: id,
      nama: json['nama'],
    );
  }

  factory LabelModel.fromjsonWithId(Map<String, dynamic> json) {
    return LabelModel(
      id: json['id'],
      nama: json['nama'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
  };
}
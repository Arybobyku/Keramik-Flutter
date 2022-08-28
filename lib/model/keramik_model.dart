class KeramikModel {
  String? id;
  String? nama;
  String? gambar;
  String? ruang;
  double? luas;
  double? harga;
  String? kualitas;
  String? tekstur;
  String? motif;
  String? deskripsi;

  KeramikModel({
    this.id,
    this.nama,
    this.gambar,
    this.deskripsi,
    this.harga,
    this.kualitas,
    this.luas,
    this.motif,
    this.ruang,
    this.tekstur,
  });

  factory KeramikModel.fromjson(Map<String, dynamic> json, String id) {
    return KeramikModel(
      id: id,
      nama: json['nama'],
      gambar: json['gambar'],
      ruang: json['ruang'],
      luas: json['luas'],
      harga: json['harga'],
      kualitas: json['kualitas'],
      tekstur: json['tekstur'],
      motif: json['motif'],
      deskripsi: json['deskripsi'],
    );
  }

  factory KeramikModel.fromjsonWithId(Map<String, dynamic> json) {
    return KeramikModel(
      id: json['id'],
      nama: json['nama'],
      gambar: json['gambar'],
      ruang: json['ruang'],
      luas: json['luas'],
      harga: json['harga'],
      kualitas: json['kualitas'],
      tekstur: json['tekstur'],
      motif: json['motif'],
      deskripsi: json['deskripsi'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'gambar': gambar,
    'ruang': ruang,
    'luas': luas,
    'harga': harga,
    'kualitas': kualitas,
    'tekstur': tekstur,
    'motif': motif,
    'deskripsi': deskripsi,
  };

}

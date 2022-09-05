class KeramikModel {
  String? id;
  String? nama;
  String? gambar;

  //ruang
  int? ruangTamu;
  int? ruangDapur;
  int? ruangKamarMandi;
  int? ruangTeras;

  //luas
  int? luasKecil;
  int? luasSedang;
  int? luasBesar;
  int? luasSangatBesar;

  ///harga
  int? harga;

  ///kualitas
  int? KW1;
  int? KW2;
  int? KW3;

  ///tekstur
  int? teksturMatte;
  int? teksturGlossy;

  ///Motif
  int? motifSederhana;
  int? motifBiasa;
  int? motifRumit;

  String? deskripsi;

  KeramikModel({
    this.id,
    this.nama,
    this.gambar,
    this.deskripsi,
    this.harga,
    this.ruangTamu,
    this.ruangDapur,
    this.ruangKamarMandi,
    this.ruangTeras,
    this.luasKecil,
    this.luasSedang,
    this.luasBesar,
    this.luasSangatBesar,
    this.KW3,
    this.KW2,
    this.KW1,
    this.teksturGlossy,
    this.teksturMatte,
    this.motifSederhana,
    this.motifBiasa,
    this.motifRumit,
  });

  factory KeramikModel.fromjson(Map<String, dynamic> json, String id) {
    return KeramikModel(
      id: id,
      nama: json['nama'],
      gambar: json['gambar'],
      deskripsi: json['deskripsi'],
      harga: json['harga'],
      ruangTeras: json['ruangTeras'],
      ruangKamarMandi: json['ruangKamarMandi'],
      ruangDapur: json['ruangDapur'],
      ruangTamu: json['ruangTamu'],
      luasSangatBesar: json['luasSangatBesar'],
      luasBesar: json['luasBesar'],
      luasSedang: json['luasSedang'],
      luasKecil: json['luasKecil'],
      KW3: json['KW3'],
      KW2: json['KW2'],
      KW1: json['KW1'],
      teksturMatte: json['teksturMatte'],
      teksturGlossy: json['teksturGlossy'],
      motifRumit: json['motifRumit'],
      motifBiasa: json['motifBiasa'],
      motifSederhana: json['motifSederhana'],
    );
  }

  factory KeramikModel.fromjsonWithId(Map<String, dynamic> json) {
    return KeramikModel(
      id: json['id'],
      nama: json['nama'],
      gambar: json['gambar'],
      deskripsi: json['deskripsi'],
      harga: json['harga'],
      ruangTeras: json['ruangTeras'],
      ruangKamarMandi: json['ruangKamarMandi'],
      ruangDapur: json['ruangDapur'],
      ruangTamu: json['ruangTamu'],
      luasSangatBesar: json['luasSangatBesar'],
      luasBesar: json['luasBesar'],
      luasSedang: json['luasSedang'],
      luasKecil: json['luasKecil'],
      KW3: json['KW3'],
      KW2: json['KW2'],
      KW1: json['KW1'],
      teksturMatte: json['teksturMatte'],
      teksturGlossy: json['teksturGlossy'],
      motifRumit: json['motifRumit'],
      motifBiasa: json['motifBiasa'],
      motifSederhana: json['motifSederhana'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'gambar': gambar,
        'deskripsi': deskripsi,
        'harga': harga,
        'ruangTamu': ruangTamu,
        'ruangDapur': ruangDapur,
        'ruangKamarMandi': ruangKamarMandi,
        'ruangTeras': ruangTeras,
        'luasKecil': luasKecil,
        'luasSedang': luasSedang,
        'luasBesar': luasBesar,
        'luasSangatBesar': luasSangatBesar,
        'KW3': KW3,
        'KW2': KW2,
        'KW1': KW1,
        'teksturGlossy': teksturGlossy,
        'teksturMatte': teksturMatte,
        'motifRumit': motifRumit,
        'motifBiasa': motifBiasa,
        'motifSederhana': motifSederhana,
      };
}

class KeramikUserInput {
  int? ruang;
  int? luas;
  int? harga;
  int? kualitas;
  int? tekstur;
  int? motif;
  KeramikModel? keramikModel;

  KeramikUserInput({
    this.motif,
    this.tekstur,
    this.kualitas,
    this.ruang,
    this.harga,
    this.luas,
    this.keramikModel,
  });
}

class KeramikRekomendasi {
  double? ruang;
  double? luas;
  double? harga;
  double? kualitas;
  double? tekstur;
  double? motif;
  double? total;
  KeramikModel? keramikModel;

  KeramikRekomendasi({
    this.motif,
    this.tekstur,
    this.kualitas,
    this.ruang,
    this.harga,
    this.luas,
    this.total,
    this.keramikModel,
  });
}

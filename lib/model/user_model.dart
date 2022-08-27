import 'dart:convert';

import 'dart:ffi';

class UserModel {
  String? id;
  String uuid;
  int? role;
  String? photoProfile;
  late String password;
  late String email;
  late String namaLengkap;
  late String tempatLahir;
  late bool isValid;

  UserModel({
    this.id,
    required this.uuid,
    this.role,
    this.photoProfile,
    required this.tempatLahir,
    required this.namaLengkap,
    required this.password,
    required this.email,
    required this.isValid,
  });

  factory UserModel.fromjson(Map<String, dynamic> json, String id) {
    var pinaltyToDate = json['pinalty']??null;
    return UserModel(
      id: id,
      uuid: json['uuid'],
      role: json['role'],
      photoProfile: json['photoProfile'],
      tempatLahir: json['tempatLahir'],
      namaLengkap: json['namaLengkap'],
      password: '',
      email: json['email'],
      isValid: json['isValid'],
    );
  }

  factory UserModel.fromjsonWithTimeStamp(Map<String, dynamic> json, String id) {
    var jsonTglLahir = json['tanggalLahir'];
    return UserModel(
      id: id,
      uuid: json['uuid'],
      role: json['role'],
      photoProfile: json['photoProfile'],
      tempatLahir: json['tempatLahir'],
      namaLengkap: json['namaLengkap'],
      password: '',
      email: json['email'],
      isValid: json['isValid'],
    );
  }

  factory UserModel.fromjsonWithId(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      uuid: json['uuid'],
      role: json['role'],
      photoProfile: json['photoProfile'],
      tempatLahir: json['tempatLahir'],
      namaLengkap: json['namaLengkap'],
      password: '',
      email: json['email'],
      isValid: json['isValid'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'uuid': uuid,
    'role': role,
    'photoProfile': photoProfile,
    'tempatLahir': tempatLahir,
    'namaLengkap': namaLengkap,
    'email': email,
    'isValid': isValid,
  };

}

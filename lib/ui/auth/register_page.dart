import 'dart:io';

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/helper/constants.dart';
import 'package:keramik/model/user_model.dart';
import 'package:keramik/provider/auth.dart';
import 'package:keramik/routes.dart';
import 'package:keramik/ui/widget/button_picker.dart';
import 'package:keramik/ui/widget/button_rounded.dart';
import 'package:keramik/ui/widget/dropdown_container.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../widget/input_field_rounded.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  File? photoProfile = null;
  File? filePicker = null;
  bool secureText = true;
  String? email = null;
  String? password = null;
  String? tanggalLahir = null;
  String? namaLengkap = null;
  String? tempatLahir = null;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.generalBackgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  "Daftar",
                  style: TextStyle(
                    fontSize: 30,
                    color: ColorPalette.generalPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                InputFieldRounded(
                  label: "Nama Lengkap",
                  hint: "Nama Lengkap",
                  onChange: (val) {
                    namaLengkap = val;
                  },
                  secureText: false,
                ),
                InputFieldRounded(
                  label: "Email",
                  hint: "Email",
                  onChange: (val) {
                    email = val;
                  },
                  secureText: false,
                ),
                InputFieldRounded(
                  label: "Tempat Lahir",
                  hint: "Tempat Lahir",
                  onChange: (val) {
                    tempatLahir = val;
                  },
                  secureText: false,
                ),
                InputFieldRounded(
                  label: "Password",
                  hint: "Password",
                  onChange: (val) {
                    password = val;
                  },
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        secureText = !secureText;
                      });
                    },
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                      color: ColorPalette.generalPrimaryColor,
                    ),
                  ),
                  secureText: secureText,
                ),
                photoProfile != null
                    ? Container(
                  margin: EdgeInsets.only(top: 15, bottom: 30),
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(photoProfile!),
                    ),
                  ),
                )
                    : ButtonPicker(
                  title: "Photo Profile",
                  onTap: () => doImagePicker(),
                ),

                ButtonRounded(
                  text: "Daftar",
                  onPressed: () {
                    doRegister(
                      context: context,
                      namaLengkap: namaLengkap,
                      tempatLahir: tempatLahir,
                      email: email,
                      password: password,
                      photoProfile: photoProfile
                    );
                  },
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  doFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc',],
    );

    if (result != null) {
      setState(() {
        filePicker = File(result.files.single.path!);
      });
    } else {
      // User canceled the picker
    }
  }


  doImagePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result != null) {
      setState(() {
        photoProfile = File(result.files.single.path!);
      });
    } else {
      // User canceled the picker
    }
  }

  doRegister({
    required BuildContext context,
    File? photoProfile,
    String? namaLengkap,
    String? tempatLahir,
    String? email,
    String? password,
  }) async {
    if (photoProfile != null &&
        namaLengkap != null &&
        tempatLahir != null &&
        email != null &&
        password != null) {
      EasyLoading.show(status: "Loading...");
      UserModel user = UserModel(
        uuid: "",
        tempatLahir: tempatLahir,
        email: email,
        password: password,
        namaLengkap: namaLengkap,
        isValid: false,
      );
      var result = await Provider.of<AuthProvider>(context, listen: false)
          .doSignUp(user: user,userProfile: photoProfile);

      result.fold((l) {
        EasyLoading.dismiss();
        Alert(
          context: context,
          type: AlertType.error,
          title: "Pendaftaran Gagal",
          desc: l,
          buttons: [
            DialogButton(
              child: Text(
                "Close",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: ColorPalette.generalPrimaryColor,
              radius: BorderRadius.circular(0.0),
            ),
          ],
        ).show();
      }, (r) {
        EasyLoading.dismiss();
        Get.offAllNamed(Routes.mainMenu);
      });
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Pendaftaran Gagal",
        desc: "Harap isi seluruh formulir",
        buttons: [
          DialogButton(
            child: Text(
              "Close",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: ColorPalette.generalPrimaryColor,
            radius: BorderRadius.circular(0.0),
          ),
        ],
      ).show();
    }
  }
}

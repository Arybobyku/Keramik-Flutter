import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keramik/routes.dart';
import 'package:keramik/ui/widget/status_peminjaman.dart';
import 'package:provider/provider.dart';

class UserRiwayatPage extends StatefulWidget {
  const UserRiwayatPage({Key? key}) : super(key: key);

  @override
  _UserRiwayatPageState createState() => _UserRiwayatPageState();
}

class _UserRiwayatPageState extends State<UserRiwayatPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
              ],
            ),
          ),
        ),
      ),
    );
  }
}

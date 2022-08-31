import 'package:flutter/material.dart';
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

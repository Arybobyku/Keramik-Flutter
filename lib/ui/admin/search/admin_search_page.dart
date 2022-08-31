import 'package:flutter/material.dart';
import 'package:keramik/provider/admin.dart';
import 'package:provider/provider.dart';

class AdminSearchPage extends StatelessWidget {
  const AdminSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<AdminProvider>(builder: (context, value, _) {
          return Column(
            children: [

            ],
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class UserDetailRiwayat extends StatelessWidget {
  const UserDetailRiwayat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),


                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

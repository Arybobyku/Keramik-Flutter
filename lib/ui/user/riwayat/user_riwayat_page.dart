import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keramik/provider/peminjaman.dart';
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
      child: Consumer<PeminjamanProvider>(builder: (context, peminjaman, _) {
        return Scaffold(
          body:  Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: peminjaman.riwayatSaya.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Provider.of<PeminjamanProvider>(context,
                              listen: false)
                              .detailRiwayatSaya(
                              peminjaman.riwayatSaya[index]);

                          Get.toNamed(Routes.detailRiwayat);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: StatusPeminjaman(
                            peminjamanModel: peminjaman.riwayatSaya[index],
                          ),
                        ),
                      );
                    },
                  ),
                  if (peminjaman.riwayatSaya.isEmpty)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: SvgPicture.asset(
                            "images/empty.svg",
                            width: 300,
                          ),
                        ),
                        Text(
                          "Anda belum memiliki riwayat peminjaman",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

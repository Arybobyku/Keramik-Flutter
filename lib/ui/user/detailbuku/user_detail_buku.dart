import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/helper/constants.dart';
import 'package:keramik/provider/auth.dart';
import 'package:keramik/provider/keramik.dart';
import 'package:keramik/provider/peminjaman.dart';
import 'package:keramik/ui/widget/button_rounded.dart';
import 'package:keramik/ui/widget/horizontal_book.dart';
import 'package:keramik/ui/widget/vertical_title_value.dart';
import 'package:provider/provider.dart';

class UserDetailBukuPage extends StatelessWidget {
  const UserDetailBukuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<KeramikProvider>(
            builder: (context, valueKeramik, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        CachedNetworkImage(
                          imageUrl: valueKeramik.keramikDetail!.gambar!,
                          imageBuilder: (context, imageProvider) => Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.fitHeight),
                            ),
                          ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Text(
                        //   valueBuku.bukuDetail!.judul,
                        //   style: TextStyle(
                        //       fontSize: 30, fontWeight: FontWeight.bold),
                        // ),
                        // SizedBox(height: 20),
                        // VerticalTitleValue(
                        //     title: 'Anak Judul',
                        //     value: valueBuku.bukuDetail!.anakJudul),
                        // SizedBox(height: 15),
                        // VerticalTitleValue(
                        //     title: 'Keterangan Ilustasi',
                        //     value: valueBuku.bukuDetail!.keteranganIlustrasi),
                        // SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          );
        }),
      ),
    );
  }
}

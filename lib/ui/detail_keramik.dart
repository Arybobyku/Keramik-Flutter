import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/model/buku_model.dart';
import 'package:keramik/model/keramik_model.dart';
import 'package:keramik/ui/widget/vertical_title_value.dart';

class KeramikDetailPage extends StatefulWidget {
  const KeramikDetailPage({Key? key}) : super(key: key);

  @override
  _KeramikDetailPageState createState() => _KeramikDetailPageState();
}

class _KeramikDetailPageState extends State<KeramikDetailPage> {
  KeramikModel keramikModel = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
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
                      imageUrl: keramikModel.gambar!,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      keramikModel.nama??"-",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    VerticalTitleValue(
                        title: 'Ruang',
                        value: keramikModel.ruang ?? "-"),
                    SizedBox(height: 15),
                    VerticalTitleValue(
                        title: 'Luas',
                        value: keramikModel.luas.toString()),
                    SizedBox(height: 15),
                    VerticalTitleValue(
                        title: 'Harga',
                        value: keramikModel.harga.toString()),
                    SizedBox(height: 15),
                    VerticalTitleValue(
                        title: 'Kualitas',
                        value: keramikModel.kualitas.toString()),
                    SizedBox(height: 15),
                    VerticalTitleValue(
                        title: 'Tekstur',
                        value: keramikModel.tekstur.toString()),
                    SizedBox(height: 15),
                    VerticalTitleValue(
                        title: 'Motif',
                        value: keramikModel.motif.toString()),
                    SizedBox(height: 15),
                    VerticalTitleValue(
                        title: 'Deskripsi',
                        value: keramikModel.deskripsi.toString()),
                    SizedBox(height: 15),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

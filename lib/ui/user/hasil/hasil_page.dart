import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keramik/model/keramik_model.dart';
import 'package:keramik/provider/keramik.dart';
import 'package:keramik/routes.dart';
import 'package:keramik/ui/widget/horizontal_keramik.dart';
import 'package:keramik/ui/widget/vertical_title_value.dart';
import 'package:provider/provider.dart';

class HasilPage extends StatefulWidget {
  const HasilPage({Key? key}) : super(key: key);

  @override
  State<HasilPage> createState() => _HasilPageState();
}

class _HasilPageState extends State<HasilPage> {
  List<KeramikRekomendasi> rangking = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<KeramikProvider>(builder: (context, valueKeramik, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CachedNetworkImage(
                    imageUrl:
                        valueKeramik.rekomendasiKeramik!.keramikModel!.gambar!,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.fitHeight),
                      ),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    valueKeramik.rekomendasiKeramik?.keramikModel?.nama ?? "-",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  VerticalTitleValue(
                      title: 'Hasil',
                      value:
                          "${valueKeramik.rekomendasiKeramik!.total!.toStringAsFixed(4)}%"),
                  SizedBox(height: 15),
                  VerticalTitleValue(
                      title: 'Harga',
                      value: valueKeramik
                          .rekomendasiKeramik!.keramikModel!.harga
                          .toString()),
                  SizedBox(height: 15),
                  VerticalTitleValue(
                      title: 'Deskripsi',
                      value: valueKeramik
                              .rekomendasiKeramik?.keramikModel?.deskripsi ??
                          "-"),
                  SizedBox(height: 15),
                  Text(
                    "List Rekomendasi :",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: rangking.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${index + 1}",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => Get.toNamed(
                                      Routes.detailKeramikGeneral,
                                      arguments: rangking[index].keramikModel!),
                                  child: HorizontalKeramik(
                                    keramikModel: rangking[index].keramikModel!,
                                    total: rangking[index].total,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

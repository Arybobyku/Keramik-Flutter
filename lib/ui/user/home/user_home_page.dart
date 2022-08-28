import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/helper/constants.dart';
import 'package:keramik/provider/auth.dart';
import 'package:keramik/provider/keramik.dart';
import 'package:keramik/provider/peminjaman.dart';
import 'package:keramik/routes.dart';
import 'package:keramik/ui/widget/book_container.dart';
import 'package:keramik/ui/widget/search_bar.dart';
import 'package:provider/provider.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer3<KeramikProvider, PeminjamanProvider,AuthProvider>(
          builder: (context, valueBuku, valuePeminjaman,valueAuth, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: SearchBar(
                      onTapSearch: () => Get.toNamed(Routes.search),
                      enable: false,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Buku",
                  style: TextStyle(
                    fontSize: 24,
                    color: ColorPalette.generalPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: valueBuku.listKeramik.length,
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 20),
                      child: BookContainer(
                        keramikModel: valueBuku.listKeramik[index],
                        onTapBook: () {
                          Provider.of<KeramikProvider>(context, listen: false)
                              .clickKeramikDetail(valueBuku.listKeramik[index]);
                          Get.toNamed(Routes.detailBuku);
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "lebih banyak buku",
                  style: TextStyle(
                    fontSize: 24,
                    color: ColorPalette.generalPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.45,
                      crossAxisSpacing: 20),
                  itemCount: valueBuku.listKeramik.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BookContainer(
                      imageHeight: 180,
                      keramikModel: valueBuku.listKeramik[index],
                      onTapBook: () {
                        Provider.of<KeramikProvider>(context, listen: false)
                            .clickKeramikDetail(valueBuku.listKeramik[index]);
                        Get.toNamed(Routes.detailBuku);
                      },
                    );
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

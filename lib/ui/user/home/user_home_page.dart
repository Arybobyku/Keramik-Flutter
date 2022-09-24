import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/provider/auth.dart';
import 'package:keramik/provider/keramik.dart';
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
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: ColorPalette.generalPrimaryColor,
      //   child: Icon(Icons.find_in_page_sharp,color: Colors.white,),
      //   onPressed: ()=>Get.toNamed(Routes.userFormPage),
      // ),
      body: Consumer2<KeramikProvider,AuthProvider>(
          builder: (context, valueBuku,valueAuth, child) {
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
                  "Keramik",
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
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 20),
                  itemCount: valueBuku.listKeramik.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BookContainer(
                      imageHeight: 180,
                      keramikModel: valueBuku.listKeramik[index],
                      onTapBook: () {
                        Get.toNamed(Routes.detailKeramikGeneral,arguments: valueBuku.listKeramik[index]);
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

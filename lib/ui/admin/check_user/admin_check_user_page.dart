import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/helper/constants.dart';
import 'package:keramik/provider/admin.dart';
import 'package:keramik/routes.dart';
import 'package:keramik/ui/widget/search_bar.dart';
import 'package:keramik/ui/widget/small_button.dart';
import 'package:keramik/ui/widget/status_container.dart';
import 'package:provider/provider.dart';

class AdminCheckUserPage extends StatefulWidget {
  const AdminCheckUserPage({Key? key}) : super(key: key);

  @override
  _AdminCheckUserPageState createState() => _AdminCheckUserPageState();
}

class _AdminCheckUserPageState extends State<AdminCheckUserPage> {
  bool getData = true;

  @override
  void initState() {
    if (getData) {
      // EasyLoading.show(status: "Loading");
      // Provider.of<AdminProvider>(context, listen: false).getAllUser();
      getData = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalette.generalBackgroundColor,
          title: Text(
            "User",
            style: TextStyle(color: ColorPalette.generalPrimaryColor),
          ),
        ),
        body: Consumer<AdminProvider>(builder: (context, valueAdmin, _) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                SearchBar(
                  title: "Cari user",
                  enable: true,
                  onSubmit: (val) {
                    Provider.of<AdminProvider>(context, listen: false)
                        .searchAnggota(val);
                  },
                ),
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: valueAdmin.listAnggotaSearch.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var anggota = valueAdmin.listAnggotaSearch[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                              onTap: () {
                                Provider.of<AdminProvider>(context, listen: false)
                                    .selectDetailAnggota(anggota);
                                Get.toNamed(Routes.adminDetailAnggota);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                padding: EdgeInsets.all(10),
                                decoration: kRoundedContainer.copyWith(
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "ID : " + anggota.uuid,
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      anggota.namaLengkap,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      anggota.email,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ),
                            ),
                    );
                  },
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

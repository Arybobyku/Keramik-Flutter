import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keramik/provider/keramik.dart';
import 'package:keramik/routes.dart';
import 'package:keramik/ui/widget/horizontal_book.dart';
import 'package:keramik/ui/widget/search_bar.dart';
import 'package:provider/provider.dart';

class UserSearchPage extends StatefulWidget {
  const UserSearchPage({Key? key}) : super(key: key);

  @override
  _UserSearchPageState createState() => _UserSearchPageState();
}

class _UserSearchPageState extends State<UserSearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<KeramikProvider>(builder: (context, value, _) {
          return Column(
            children: [
              SizedBox(height: 15),
              SearchBar(
                onChanged: (val) {
                  Provider.of<KeramikProvider>(context, listen: false)
                      .searchKeramik(val);
                },
              ),
              SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: value.searchResult.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: GestureDetector(
                              onTap: (){
                                Get.toNamed(Routes.detailKeramikGeneral,arguments: value.searchResult[index]);
                              },
                              child: HorizontalKeramik(
                                keramikModel: value.searchResult[index],
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

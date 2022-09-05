import 'package:flutter/material.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/provider/kriteria.dart';
import 'package:keramik/ui/widget/button_rounded.dart';
import 'package:keramik/ui/widget/input_field_rounded.dart';
import 'package:provider/provider.dart';

class KriteriaPage extends StatefulWidget {
  const KriteriaPage({Key? key}) : super(key: key);

  @override
  State<KriteriaPage> createState() => _KriteriaPageState();
}

class _KriteriaPageState extends State<KriteriaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Kriteria",
          style: TextStyle(color: ColorPalette.generalPrimaryColor),
        ),
      ),
      backgroundColor: ColorPalette.generalBackgroundColor,
      body: SafeArea(
        child: Consumer<KriteriaProvider>(builder: (context, valueKriteria, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: valueKriteria.listKriteria.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var kriteria = valueKriteria.listKriteria[index];
                      return InputFieldRounded(
                        label: kriteria.nama??"-",
                        hint: '',
                        initialValue:kriteria.bobot.toString(),
                        onChange: (val) {
                          valueKriteria.listKriteria[index].bobot = int.parse(val);
                        },
                        secureText: false,
                      );
                    },
                  ),
                  ButtonRounded(text: "Ubah")
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

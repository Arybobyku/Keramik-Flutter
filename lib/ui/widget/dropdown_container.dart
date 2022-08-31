import 'package:flutter/material.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/helper/constants.dart';

class DropdownContainer extends StatelessWidget {
  const DropdownContainer({
    Key? key,
    required this.hint,
    required this.value,
    required this.onChanged,
    required this.items,
  }) : super(key: key);

  final String hint;
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0,top: 10),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: DropdownButton(
        value: value,
        isExpanded: true,
        underline: SizedBox(),
        hint: Text(
          hint,
          style: TextStyle(color: ColorPalette.generalDarkGrey),
        ),
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

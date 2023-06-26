import 'package:cardtrading/ui/utils/colors.dart';
import 'package:cardtrading/ui/utils/text_style.dart';
import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  const CommonText({super.key, required this.text,this.weight = FontWeight.normal,this.fontSize = 18, this.align = TextAlign.start});
  final String text;
  final FontWeight weight;
  final double fontSize;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyles.regular.copyWith(
        fontSize: fontSize,
        color: MyColors.greyText,
        fontWeight: weight,
      ),
    );
  }
}

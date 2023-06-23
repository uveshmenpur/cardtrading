import 'package:cardtrading/ui/utils/colors.dart';
import 'package:cardtrading/ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTitle extends StatelessWidget {
  const CommonTitle({super.key, required this.text,this.weight = FontWeight.normal,this.fontSize = 18, this.align = TextAlign.start, this.tStyle});
  final String text;
  final FontWeight weight;
  final double fontSize;
  final TextAlign align;
  final TextStyle? tStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: 2,
      style: TextStyle(
        fontFamily: TextStyles.fontFamily,
        fontSize: fontSize.sp,
        color: MyColors.golden,
        fontWeight: weight,
      ),
    );
  }
}

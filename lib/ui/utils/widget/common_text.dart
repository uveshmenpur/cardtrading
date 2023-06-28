
import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  const CommonText({
    super.key,
    required this.text,
    this.align = TextAlign.start,
    required this.textStyles,
  });

  final String text;
  final TextStyle textStyles;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: textStyles,
    );
  }
}

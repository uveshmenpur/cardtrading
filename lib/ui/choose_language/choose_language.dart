import 'package:cardtrading/ui/choose_language/mobile/choose_language_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context,sizingInformation){
      if(sizingInformation.isMobile){
        return const ChooseLanguageMobile();
      }
      return const ChooseLanguageMobile();
    });
  }
}

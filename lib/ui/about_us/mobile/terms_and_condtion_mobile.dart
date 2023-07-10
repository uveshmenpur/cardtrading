import 'package:cardtrading/ui/about_us/mobile/helper/about_us_screen.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:flutter/material.dart';

class TermsAndConditionMobile extends StatelessWidget {
  const TermsAndConditionMobile({super.key});

  @override
  Widget build(BuildContext context) {

    ///Common Screen for both About Us and Terms And Condition as both pages have same content
    return const AboutUsScreen(title: AppStrings.keyTermsAndCondition);
  }
}

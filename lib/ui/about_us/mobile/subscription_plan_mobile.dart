import 'package:cardtrading/ui/about_us/mobile/helper/about_us_screen.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:flutter/material.dart';

class SubscriptionPlanMobile extends StatelessWidget {
  const SubscriptionPlanMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const AboutUsScreen(title: AppStrings.keyTermsAndCondition);
  }
}

import 'package:cardtrading/ui/onboarding/mobile/onboarding_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context,sizingInformation){
      if(sizingInformation.isMobile){
        return const OnBoardingMobile();
      }
      return const OnBoardingMobile();
    });
  }
}

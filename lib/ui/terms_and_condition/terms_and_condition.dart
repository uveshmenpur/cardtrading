import 'package:cardtrading/ui/terms_and_condition/mobile/terms_and_condition_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.isMobile) {
        return const TermsAndConditionMobile();
      }
      return const TermsAndConditionMobile();
    });
  }
}

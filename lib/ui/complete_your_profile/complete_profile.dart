import 'package:cardtrading/ui/complete_your_profile/mobile/complete_profile_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context,sizingInformation){
      if(sizingInformation.isMobile){
        return const CompleteProfileMobile();
      }
      return const CompleteProfileMobile();
    });
  }
}

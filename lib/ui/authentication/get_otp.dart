import 'package:cardtrading/ui/authentication/mobile/get_otp_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GetOtp extends StatelessWidget {
  const GetOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context,sizingInformation){
      if(sizingInformation.isMobile){
        return const GetOtpMobile();
      }
      return const GetOtpMobile();
    });
  }
}

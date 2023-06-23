import 'package:cardtrading/ui/splashscreen/mobile/splash_screen_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context,sizingInformation){
      if(sizingInformation.isMobile){
        return const SplashScreenMobile();
      }
      return const SplashScreenMobile();
    });
  }
}

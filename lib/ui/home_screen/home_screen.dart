import 'package:cardtrading/ui/home_screen/mobile/home_screen_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context,sizingInformation){
      if(sizingInformation.isMobile){
        return const HomeScreenMobile();
      }
      return const HomeScreenMobile();
    });
  }
}

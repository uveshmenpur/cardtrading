import 'package:cardtrading/ui/complete_your_profile/mobile/add_address_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context,sizingInformation){
      if(sizingInformation.isMobile){
        return const AddAddressMobile();
      }
      return const AddAddressMobile();
    });
  }
}

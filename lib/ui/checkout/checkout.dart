import 'package:cardtrading/ui/checkout/mobile/checkout_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context,sizingInformation){
      if(sizingInformation.isMobile){
        return const CheckoutMobile();
      }
      return const CheckoutMobile();
    });
  }
}

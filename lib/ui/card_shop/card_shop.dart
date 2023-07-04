import 'package:cardtrading/ui/card_shop/mobile/card_shop_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CardShop extends StatelessWidget {
  const CardShop({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context,sizingInformation){
      if(sizingInformation.isMobile){
        return const CardShopMobile();
      }
      return const CardShopMobile();
    });
  }
}

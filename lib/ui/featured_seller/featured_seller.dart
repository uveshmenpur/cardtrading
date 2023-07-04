import 'package:cardtrading/ui/featured_seller/mobile/featured_seller_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FeaturedSeller extends StatelessWidget {
  const FeaturedSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context,sizingInformation){
      if(sizingInformation.isMobile){
        return const FeaturedSellerMobile();
      }
      return const FeaturedSellerMobile();
    });
  }
}

import 'package:cardtrading/ui/card_details/mobile/card_details_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context,sizingInformation){
      if(sizingInformation.isMobile){
        return CardDetailsMobile(url: url,);
      }
      return CardDetailsMobile(url: url,);
    });
  }
}

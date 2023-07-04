import 'package:cardtrading/ui/about_us/mobile/subscription_plan_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SubscriptionPlan extends StatelessWidget {
  const SubscriptionPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context,sizingInformation){
      if(sizingInformation.isMobile){
        return const SubscriptionPlanMobile();
      }
      return const SubscriptionPlanMobile();
    });
  }
}

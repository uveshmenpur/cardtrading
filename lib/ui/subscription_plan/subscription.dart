import 'package:cardtrading/ui/subscription_plan/mobile/subscription_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Subscription extends StatelessWidget {
  const Subscription({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.isMobile) {
        return const SubscriptionMobile();
      }
      return const SubscriptionMobile();
    });
  }
}


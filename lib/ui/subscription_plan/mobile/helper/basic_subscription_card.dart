import 'package:cardtrading/ui/subscription_plan/mobile/helper/subscription_card.dart';
import 'package:cardtrading/ui/subscription_plan/mobile/helper/subscription_screen.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:flutter/material.dart';

class BasicSubscriptionCard extends StatelessWidget {
  const BasicSubscriptionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SubscriptionPlanCard(
      subscriptionPlan: AppStrings.keyBasicSubscriptionPlan,
      planBenefits: AppStrings.keyBasicPlanBenefits,
      url: '${AppAssets.svgLocation}silver.svg',
      borderColor: AppColors.cardSilver,
      planKd: AppStrings.keyBasicKd,
      subscriptionPlanOne: AppStrings.keyBasicConditionOne,
      subscriptionPlanTwo: AppStrings.keyBasicConditionTwo,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SubscriptionPlanScreen(
                url: '${AppAssets.svgLocation}silver.svg',
                cardLimitOne: AppStrings.keyBasicCardDetailsOne,
                cardLimitTwo: AppStrings.keyBasicCardDetailsTwo,
                cardLimitThree: AppStrings.keyBasicCardDetailsThree,
                rewardPointOne: AppStrings.keyBasicRewardsPointsOne,
                rewardPointTwo: AppStrings.keyBasicRewardsPointsTwo,
                rewardPointThree: AppStrings.keyBasicRewardsPointsThree,
              );
            },
          ),
        );
      },
    );
  }
}

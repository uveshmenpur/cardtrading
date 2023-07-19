import 'package:cardtrading/ui/subscription_plan/mobile/helper/subscription_card.dart';
import 'package:cardtrading/ui/subscription_plan/mobile/helper/subscription_screen.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:flutter/material.dart';
class PremiumSubscriptionCard extends StatelessWidget {
  const PremiumSubscriptionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SubscriptionPlanCard(
      subscriptionPlan: AppStrings.keyPremiumSubscriptionPlan,
      planBenefits: AppStrings.keyPremiumPlanBenefits,
      url: '${AppAssets.svgLocation}bronze.svg',
      borderColor: AppColors.cardBronze,
      planKd: AppStrings.keyPremiumKd,
      subscriptionPlanOne: AppStrings.keyPremiumConditionOne,
      subscriptionPlanTwo: AppStrings.keyPremiumConditionTwo,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SubscriptionPlanScreen(
                url: '${AppAssets.svgLocation}bronze.svg',
                cardLimitOne: AppStrings.keyPremiumCardDetailsOne,
                cardLimitTwo: AppStrings.keyPremiumCardDetailsTwo,
                cardLimitThree: AppStrings.keyPremiumCardDetailsThree,
                rewardPointOne: AppStrings.keyPremiumRewardsPointsOne,
                rewardPointTwo: AppStrings.keyPremiumRewardsPointsTwo,
                rewardPointThree:
                AppStrings.keyPremiumRewardsPointsThree,
              );
            },
          ),
        );
      },
    );
  }
}


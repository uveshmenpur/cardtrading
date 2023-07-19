import 'package:cardtrading/ui/subscription_plan/mobile/helper/subscription_card.dart';
import 'package:cardtrading/ui/subscription_plan/mobile/helper/subscription_screen.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:flutter/material.dart';

class EliteSubscriptionCard extends StatelessWidget {
  const EliteSubscriptionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SubscriptionPlanCard(
      subscriptionPlan: AppStrings.keyEliteSubscriptionPlan,
      planBenefits: AppStrings.keyElitePlanBenefits,
      url: '${AppAssets.svgLocation}golden.svg',
      borderColor: AppColors.cardGolden,
      planKd: AppStrings.keyEliteKd,
      subscriptionPlanOne: AppStrings.keyEliteConditionOne,
      subscriptionPlanTwo: AppStrings.keyEliteConditionTwo,
      subscriptionPlanThree: AppStrings.keyEliteConditionThree,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SubscriptionPlanScreen(
                url: '${AppAssets.svgLocation}golden.svg',
                cardLimitOne: AppStrings.keyEliteCardDetailsOne,
                cardLimitTwo: AppStrings.keyEliteCardDetailsTwo,
                cardLimitThree: AppStrings.keyEliteCardDetailsThree,
                rewardPointOne: AppStrings.keyEliteRewardsPointsOne,
                rewardPointTwo: AppStrings.keyEliteRewardsPointsTwo,
                rewardPointThree: AppStrings.keyEliteRewardsPointsThree,
                verifiedBadgeOne: AppStrings.keyEliteVerifiedBadgeOne,
                verifiedBadgeTwo: AppStrings.keyEliteVerifiedBadgeTwo,
              );
            },
          ),
        );
      },
    );
  }
}

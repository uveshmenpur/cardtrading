
import 'package:cardtrading/ui/subscription_plan/mobile/helper/subscription_card.dart';
import 'package:cardtrading/ui/subscription_plan/mobile/helper/subscription_screen.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionPlanBody extends StatelessWidget {
  const SubscriptionPlanBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///
          CommonTitle(
            text: AppStrings.keyChooseYourPlan,
            tStyle: TextStyles.regular
                .copyWith(fontFamily: 'Sora', color: AppColors.golden),
            align: TextAlign.start,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            AppStrings.keyTermsAndConditionDescription,
            style: TextStyles.regular.copyWith(
                color: AppColors.greyText,
                fontSize: 12.sp,
                overflow: TextOverflow.ellipsis
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SubscriptionPlanCard(
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
          ),
          SizedBox(
            height: 20.h,
          ),
          SubscriptionPlanCard(
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
          ),
          SizedBox(
            height: 20.h,
          ),
          SubscriptionPlanCard(
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
                      rewardPointThree: AppStrings.keyPremiumRewardsPointsThree,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

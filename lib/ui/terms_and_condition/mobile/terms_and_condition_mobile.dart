import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_drawer.dart';
import 'package:cardtrading/ui/terms_and_condition/mobile/helper/terms_and_condition_card.dart';
import 'package:cardtrading/ui/terms_and_condition/mobile/helper/terms_and_condition_screen.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_text.dart';
import 'package:cardtrading/ui/utils/widget/common_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TermsAndConditionMobile extends StatefulWidget {
  const TermsAndConditionMobile({super.key});

  @override
  State<TermsAndConditionMobile> createState() =>
      _TermsAndConditionMobileState();
}

class _TermsAndConditionMobileState extends State<TermsAndConditionMobile> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      key: _globalKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: SvgPicture.asset('${AppAssets.svgLocation}menu.svg'),
          onPressed: () {
            _globalKey.currentState!.openDrawer();
          },
        ),
        title: Text(
          AppStrings.keySubscriptionPlan,
          style: TextStyles.regular.copyWith(
            fontSize: 16.sp,
            fontFamily: 'Sora',
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
      ),
      drawer: const HomeScreenDrawer(),
      body: SingleChildScrollView(
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
            CommonText(
              text: AppStrings.keyTermsAndConditionDescription,
              textStyles: TextStyles.regular.copyWith(
                color: AppColors.greyText,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TermsAndConditionCard(
              subscriptionPlan: AppStrings.keyEliteSubscriptionPlan,
              planBenefits: AppStrings.keyElitePlanBenefits,
              url: '${AppAssets.svgLocation}golden.svg',
              borderColor: AppColors.cardGolden,
              planKd: AppStrings.keyEliteKd,
              termsAndConditionOne: AppStrings.keyEliteConditionOne,
              termsAndConditionTwo: AppStrings.keyEliteConditionTwo,
              termsAndConditionThree: AppStrings.keyEliteConditionThree,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TermsAndConditionScreen(
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
            TermsAndConditionCard(
              subscriptionPlan: AppStrings.keyBasicSubscriptionPlan,
              planBenefits: AppStrings.keyBasicPlanBenefits,
              url: '${AppAssets.svgLocation}silver.svg',
              borderColor: AppColors.cardSilver,
              planKd: AppStrings.keyBasicKd,
              termsAndConditionOne: AppStrings.keyBasicConditionOne,
              termsAndConditionTwo: AppStrings.keyBasicConditionTwo,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TermsAndConditionScreen(
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
            TermsAndConditionCard(
              subscriptionPlan: AppStrings.keyPremiumSubscriptionPlan,
              planBenefits: AppStrings.keyPremiumPlanBenefits,
              url: '${AppAssets.svgLocation}bronze.svg',
              borderColor: AppColors.cardBronze,
              planKd: AppStrings.keyPremiumKd,
              termsAndConditionOne: AppStrings.keyPremiumConditionOne,
              termsAndConditionTwo: AppStrings.keyPremiumConditionTwo,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TermsAndConditionScreen(
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
      ),
    );
  }
}

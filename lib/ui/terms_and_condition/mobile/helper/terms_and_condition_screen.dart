import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TermsAndConditionScreen extends StatelessWidget {
  TermsAndConditionScreen(
      {super.key,
      required this.url,
      required this.cardLimitOne,
      required this.cardLimitTwo,
      required this.cardLimitThree,
      required this.rewardPointOne,
      required this.rewardPointTwo,
      required this.rewardPointThree,
      this.verifiedBadgeOne,
      this.verifiedBadgeTwo});

  final String? url;
  final starSvgPath = '${AppAssets.svgLocation}star.svg';
  final String cardLimitOne;
  final String cardLimitTwo;
  final String cardLimitThree;
  final String rewardPointOne;
  final String rewardPointTwo;
  final String rewardPointThree;
  final String? verifiedBadgeOne;
  final String? verifiedBadgeTwo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
        title: Text(
          AppStrings.keyTermsAndCondition,
          style: TextStyles.bold.copyWith(
            fontSize: 16.sp,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                url ?? '${AppAssets.svgLocation}golden.svg',
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                AppStrings.keyCardLimit,
                style: TextStyles.medium.copyWith(
                  color: AppColors.white,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              _text(cardLimitOne),
              SizedBox(
                height: 10.h,
              ),
              _text(cardLimitTwo),
              SizedBox(
                height: 10.h,
              ),
              _text(cardLimitThree),
              SizedBox(
                height: 10.h,
              ),
              const Divider(
                thickness: 1.0,
                color: AppColors.indicatorColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                AppStrings.keyRewardsPoint,
                style: TextStyles.medium.copyWith(
                  color: AppColors.white,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              _text(rewardPointOne),
              SizedBox(
                height: 10.h,
              ),
              _text(rewardPointTwo),
              SizedBox(
                height: 10.h,
              ),
              _text(rewardPointThree),
              SizedBox(
                height: 10.h,
              ),
              verifiedBadgeOne != null
                  ? const Divider(
                      thickness: 1.0,
                      color: AppColors.indicatorColor,
                    )
                  : const Text(''),
              SizedBox(
                height: 10.h,
              ),
              Text(
                verifiedBadgeOne != null ? AppStrings.keyVerifiedBadge : '',
                style: TextStyles.medium.copyWith(
                  color: AppColors.white,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              verifiedBadgeOne != null
                  ? _text(verifiedBadgeTwo ?? '')
                  : Container(),
              SizedBox(
                height: 10.h,
              ),
              verifiedBadgeOne != null
                  ? _text(verifiedBadgeTwo ?? '')
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: SvgPicture.asset(
            starSvgPath,
            width: 10.w,
            height: 10.h,
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        Expanded(
          child: Text(
            text,
            softWrap: true,
            maxLines: 3,
            style: TextStyles.light.copyWith(
              fontSize: 12.sp,
              color: AppColors.greyText,
            ),
          ),
        ),
      ],
    );
  }
}

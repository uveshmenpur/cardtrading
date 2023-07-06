import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubscriptionPlanCard extends StatelessWidget {
  const SubscriptionPlanCard({
    super.key,
    required this.subscriptionPlan,
    required this.planBenefits,
    required this.borderColor,
    required this.planKd,
    required this.subscriptionPlanOne,
    required this.subscriptionPlanTwo,
    this.subscriptionPlanThree,
    required this.url,
    this.onTap,
  });

  final String subscriptionPlan;
  final String planBenefits;
  final String planKd;
  final String url;
  final String subscriptionPlanOne;
  final String subscriptionPlanTwo;
  final String? subscriptionPlanThree;
  final void Function()? onTap;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  url,
                  width: 24.w,
                  height: 24.h,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              subscriptionPlan,
              style: TextStyles.regular.copyWith(
                fontFamily: 'Sora',
                fontSize: 12.sp,
                color: AppColors.greyText,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              planBenefits,
              style: TextStyles.extraLight.copyWith(
                fontSize: 10.sp,
                fontFamily: 'Sora',
                color: AppColors.greyText,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              AppStrings.keyTermsAndCondition,
              style: TextStyles.extraLight.copyWith(
                fontSize: 10,
                fontFamily: 'Sora',
                color: AppColors.primary,
              ),
            ),
            const Divider(
              color: AppColors.indicatorColor,
              thickness: 1.0,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              planKd,
              style: TextStyles.bold.copyWith(
                fontFamily: 'Sora',
                fontSize: 26.sp,
                color: borderColor,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  '${AppAssets.svgLocation}terms_and_condition.svg',
                  width: 20.w,
                  height: 20.h,
                ),
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  subscriptionPlanOne,
                  style: TextStyles.light.copyWith(
                    fontSize: 12.sp,
                    fontFamily: 'Sora',
                    color: AppColors.containerText,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  '${AppAssets.svgLocation}terms_and_condition.svg',
                  width: 20.w,
                  height: 20.h,
                ),
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  subscriptionPlanTwo,
                  style: TextStyles.light.copyWith(
                    fontSize: 12.sp,
                    fontFamily: 'Sora',
                    color: AppColors.containerText,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            planKd == '60 KD'
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        '${AppAssets.svgLocation}terms_and_condition.svg',
                        width: 20.w,
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        planKd == '60 KD'
                            ? subscriptionPlanThree.toString()
                            : '',
                        style: TextStyles.light.copyWith(
                          fontSize: 12.sp,
                          fontFamily: 'Sora',
                          color: AppColors.containerText,
                        ),
                      ),
                    ],
                  )
                : const Text(''),
            planKd == '60 KD'
                ? SizedBox(
                    height: 20.h,
                  )
                : Container(),
            InkWell(
              child: Container(
                width: double.infinity,
                height: 46.h,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.keyBuyNow,
                      style: TextStyles.semiBold.copyWith(
                        fontFamily: 'Sora',
                        fontSize: 14.sp,
                        color: AppColors.dividerColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        '${AppAssets.svgLocation}arrow.svg',
                        width: 14.w,
                        height: 14.h,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

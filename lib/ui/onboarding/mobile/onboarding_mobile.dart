import 'package:cardtrading/ui/onboarding/mobile/helper/on_boarding_bottom_button.dart';
import 'package:cardtrading/ui/onboarding/mobile/helper/onboarding_center_widget.dart';
import 'package:cardtrading/ui/onboarding/mobile/helper/onboarding_page_indicator.dart';
import 'package:cardtrading/ui/onboarding/mobile/helper/onboarding_skip_button.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingMobile extends StatelessWidget {
  const OnBoardingMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  ///Skip Button
                  const SkipButton(),
                  ///space left out for animation
                  const OnBoardingCenterWidget(),
                  ///Page Indicator Boxes
                  const OnBoardingPageIndicator(),
                ],
              ),
            ),
            ///Display Common Button on first 2 pages and Slider on 3rd page
            const OnBoardingBottomButton(),
          ],
        ),
      ),
    );
  }
}

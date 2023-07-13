import 'package:cardtrading/framework/controllers/onboarding/onboarding_controller.dart';
import 'package:cardtrading/ui/authentication/sign_in.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slider_button/slider_button.dart';

import '../../../utils/theme/assets.dart';

class OnBoardingSliderButton extends StatelessWidget {
  const OnBoardingSliderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final onBoardingWatch = ref.watch(onBoardingController);
        return SliderButton(
          backgroundColor: AppColors.background,
          width: double.infinity,
          action: () {
            onBoardingWatch.changePage(0);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const SignIn();
                },
              ),
            );
          },
          alignLabel: Alignment.center,
          highlightedColor: AppColors.primary,
          baseColor: AppColors.primary,
          label: Text(
            AppStrings.keySwipeToGetStarted,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold.copyWith(
              color: AppColors.primary,
              fontSize: 16.sp,
            ),
          ),
          child: Container(
            color: Colors.transparent,
            child: SvgPicture.asset(
              '${AppAssets.svgLocation}swipeicon.svg',
              matchTextDirection: true,
            ),
          ),
        );
      },
    );
  }
}

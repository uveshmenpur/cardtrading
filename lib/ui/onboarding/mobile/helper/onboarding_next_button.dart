import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../framework/controllers/onboarding/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final onBoardingWatch = ref.watch(onBoardingController);
        return CommonButton(
          buttonHeight: 50.h,
          buttonText: AppStrings.keyNext,
          buttonTextStyle: TextStyles.semiBold.copyWith(
            fontSize: 16.sp,
            color: AppColors.selectedButtonText,
          ),
          onPressed: () {
            onBoardingWatch.increment();
            onBoardingWatch.animateToNextPage();
          },
        );
      },
    );
  }
}

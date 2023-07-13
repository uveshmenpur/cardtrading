import 'package:cardtrading/framework/controllers/onboarding/onboarding_controller.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPageIndicator extends StatelessWidget {
  const OnBoardingPageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final onBoardingWatch = ref.watch(onBoardingController);
        return Row(
          children: List.generate(
            onBoardingWatch.onBoardingTitle.length,
            (index) {
              return Container(
                margin: EdgeInsets.only(right: 5.w),
                height: 6.h,
                width: onBoardingWatch.selectedPage == index ? 20.w : 6.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: onBoardingWatch.selectedPage == index
                        ? AppColors.primary
                        : Colors.transparent,
                  ),
                  color: onBoardingWatch.selectedPage == index
                      ? Colors.transparent
                      : AppColors.indicatorColor,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

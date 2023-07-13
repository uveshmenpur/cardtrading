import 'package:cardtrading/framework/controllers/onboarding/onboarding_controller.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final onBoardingWatch = ref.watch(onBoardingController);
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: onBoardingWatch.selectedPage != 2
                  ? Text(
                      AppStrings.keySkip,
                      textAlign: TextAlign.start,
                      style: TextStyles.light.copyWith(
                        color: AppColors.checkoutTextColor,
                      ),
                    )
                  : const SizedBox(),
              onPressed: () {
                onBoardingWatch
                    .changePage(onBoardingWatch.onBoardingTitle.length - 1);
                onBoardingWatch.animateToNextPage();
              },
            ),
          ],
        );
      },
    );
  }
}

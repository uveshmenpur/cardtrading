import 'package:cardtrading/framework/controllers/onboarding/onboarding_controller.dart';
import 'package:cardtrading/ui/onboarding/mobile/helper/onboarding_next_button.dart';
import 'package:cardtrading/ui/onboarding/mobile/helper/onboarding_slider_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnBoardingBottomButton extends StatelessWidget {
  const OnBoardingBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final onBoardingWatch = ref.watch(onBoardingController);
        return onBoardingWatch.selectedPage == 2
            ? const OnBoardingSliderButton()
            : const OnBoardingNextButton();
      },
    );
  }
}

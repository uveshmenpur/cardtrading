import 'package:cardtrading/ui/onboarding/onboarding.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';

class KeepGoingButton extends StatelessWidget {
  const KeepGoingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const OnBoardingOne();
            },
          ),
        );
      },
      buttonText: 'Keep Going',
    );
  }
}

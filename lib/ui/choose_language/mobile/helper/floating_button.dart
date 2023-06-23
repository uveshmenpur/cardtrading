import 'package:cardtrading/ui/onboarding/onboarding.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseLanguageFAB extends StatelessWidget {
  const ChooseLanguageFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12.0),
      child: SizedBox(
        height: 46.h,
        width: 0.9.sw,
        child: Center(
          child: CommonButton(
            text: 'Keep Going',
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
          ),
        ),
      ),
    );
  }
}

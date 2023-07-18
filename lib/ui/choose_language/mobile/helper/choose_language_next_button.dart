import 'package:cardtrading/ui/onboarding/onboarding.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseLanguageNextButton extends StatelessWidget {
  const ChooseLanguageNextButton({
    super.key,
  });

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
      buttonText: AppStrings.keyKeepGoing,
      buttonTextStyle: TextStyles.semiBold.copyWith(
        fontSize: 16.sp,
        color: AppColors.selectedButtonText,
      ),
    );
  }
}

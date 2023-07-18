
import 'package:cardtrading/framework/controllers/choose_language/choose_language_controller.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseLanguageButton extends StatelessWidget {
  const ChooseLanguageButton({
    super.key, required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final chooseLanguageWatch = ref.watch(chooseLanguageController);
            return CommonButton(
              align: TextAlign.left,
              buttonHeight: 46.h,
              onPressed: () {
                chooseLanguageWatch.changeLanguage(index);
              },
              buttonPadding: EdgeInsets.symmetric(horizontal: 15.w),
              buttonBackgroundColor: chooseLanguageWatch.selectedLanguage ==
                  chooseLanguageWatch.languages[index]
                  ? AppColors.primary
                  : AppColors.buttonBg,
              buttonText: chooseLanguageWatch.languages[index],
              suffixWidget: chooseLanguageWatch.selectedLanguage ==
                  chooseLanguageWatch.languages[index]
                  ? const Icon(
                Icons.check,
                color: Colors.black,
              )
                  : null,
              buttonTextStyle: TextStyles.light.copyWith(
                color: chooseLanguageWatch.selectedLanguage ==
                    chooseLanguageWatch.languages[index]
                    ? AppColors.selectedButtonText
                    : AppColors.buttonText,
                fontSize: 14.sp,
                fontFamily: 'Sora',
              ),
            );
          }
      ),
    );
  }
}

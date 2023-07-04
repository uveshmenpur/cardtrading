import 'package:cardtrading/ui/choose_language/mobile/helper/keep_going_button.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:cardtrading/ui/utils/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseLanguageMobile extends StatefulWidget {
  const ChooseLanguageMobile({super.key});

  @override
  State<ChooseLanguageMobile> createState() => _ChooseLanguageMobileState();
}

class _ChooseLanguageMobileState extends State<ChooseLanguageMobile> {
  ///boolean values to check which language is selected

  List<String> languages = ['English', 'عربي'];
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: AppStrings.keyChooseLangTitle,
                    textStyles: TextStyles.medium
                        .copyWith(fontSize: 18.sp, color: AppColors.golden),
                  ),
                  SizedBox(height: 10.h),
                  CommonText(
                    text: AppStrings.keyChooseLangContent,
                    align: TextAlign.start,
                    textStyles: TextStyles.regular
                        .copyWith(fontSize: 14.sp, color: AppColors.greyText),
                  ),

                  const SizedBox(
                    height: 36,
                  ),

                  /// Language Button
                  ...List.generate(
                    languages.length,
                    (index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 25.h),
                        child: CommonButton(
                          align: TextAlign.left,
                          buttonHeight: 46.h,
                          onPressed: () {
                            setState(
                              () {
                                selectedLanguage = languages[index];
                              },
                            );
                          },
                          buttonPadding: EdgeInsets.symmetric(horizontal: 15.w),
                          buttonBackgroundColor:
                              selectedLanguage == languages[index]
                                  ? AppColors.primary
                                  : AppColors.buttonBg,
                          buttonText: languages[index],
                          suffixWidget: selectedLanguage == languages[index]
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.black,
                                )
                              : null,
                          buttonTextStyle: TextStyles.light.copyWith(
                            color: selectedLanguage == languages[index]
                                ? AppColors.selectedButtonText
                                : AppColors.buttonText,
                            fontSize: 14.sp,
                            fontFamily: 'Sora',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const KeepGoingButton(),
          ],
        ),
      ),
    );
  }
}

import 'package:cardtrading/framework/controllers/choose_language/choose_language_controller.dart';
import 'package:cardtrading/ui/onboarding/onboarding.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseLanguageMobile extends ConsumerStatefulWidget {
  const ChooseLanguageMobile({super.key});

  @override
  ConsumerState<ChooseLanguageMobile> createState() =>
      _ChooseLanguageMobileState();
}

class _ChooseLanguageMobileState extends ConsumerState<ChooseLanguageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: AppColors.background,
      body: _bodyWidget(context),
    );
  }

  ///Body Widget
  Widget _bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.keyChooseLangTitle,
                  style: TextStyles.medium
                      .copyWith(fontSize: 18.sp, color: AppColors.golden),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppStrings.keyChooseLangContent,
                  style: TextStyles.regular
                      .copyWith(fontSize: 14.sp, color: AppColors.greyText),
                ),

                const SizedBox(
                  height: 40,
                ),

                /// Buttons to Select Languages
                ..._languageButtons(),
              ],
            ),
          ),

          ///Common Button
          _keepGoingButton(context),
        ],
      ),
    );
  }

  List<Widget> _languageButtons() {
    return List.generate(
      ref.watch(chooseLanguageController).languages.length,
      (index) {
        return Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final chooseLanguageWatch = ref.watch(chooseLanguageController);
          return Padding(
            padding: EdgeInsets.only(bottom: 25.h),
            child: CommonButton(
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
            ),
          );
        });
      },
    );
  }

  Widget _keepGoingButton(BuildContext context) {
    ///Common Button Widget
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

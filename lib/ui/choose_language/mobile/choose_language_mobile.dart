import 'package:cardtrading/framework/controllers/choose_language/choose_language_controller.dart';
import 'package:cardtrading/ui/choose_language/mobile/helper/choose_language_button.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cardtrading/ui/choose_language/mobile/helper/choose_language_next_button.dart';

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
      appBar: const CommonAppBar(
        backgroundColor: Colors.transparent,
        title: '',
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
                  ...List.generate(
                    ref.watch(chooseLanguageController).languages.length,
                    (index) {
                      return ChooseLanguageButton(index: index);
                    },
                  ),
                ],
              ),
            ),

            ///Choose Language Next Button
            const ChooseLanguageNextButton(),
          ],
        ),
      ),
    );
  }
}

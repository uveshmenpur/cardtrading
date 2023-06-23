import 'package:cardtrading/ui/choose_language/mobile/helper/choose_language_button.dart';
import 'package:cardtrading/ui/choose_language/mobile/helper/floating_button.dart';
import 'package:cardtrading/ui/utils/colors.dart';
import 'package:cardtrading/ui/utils/my_strings.dart';
import 'package:cardtrading/ui/utils/widget/common_text.dart';
import 'package:cardtrading/ui/utils/widget/common_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseLanguageMobile extends StatefulWidget {
  const ChooseLanguageMobile({super.key});

  @override
  State<ChooseLanguageMobile> createState() => _ChooseLanguageMobileState();
}

class _ChooseLanguageMobileState extends State<ChooseLanguageMobile> {
  ///boolean values to check which language is selected
  bool englishSelected = false;
  bool arabicSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Padding(
        padding: EdgeInsets.only(
            left: 16.0.r, bottom: 16.0.r, right: 16.0.r, top: 50.0.r),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(8.0.r, 12.0.r, 0.0.r, 0.0.r),
                child: const CommonTitle(
                  text: MyStrings.chooseLangTitle,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8.0.r, 6.0.r, 0.0.r, 0.0.r),
                child: CommonText(
                  text: MyStrings.chooseLangContent,
                  align: TextAlign.start,
                  fontSize: 16.sp,
                ),
              ),

              const SizedBox(
                height: 36,
              ),

              ///English Language Button
              ChooseLanguageButton(
                text: 'English',
                isSelected: englishSelected,
                onPressed: () {
                  setState(
                    () {
                      englishSelected = true;
                      arabicSelected = false;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),

              ///Arabic Language Button
              ChooseLanguageButton(
                text: MyStrings.arabic,
                isSelected: arabicSelected,
                onPressed: () {
                  setState(
                    () {
                      englishSelected = false;
                      arabicSelected = true;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const ChooseLanguageFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

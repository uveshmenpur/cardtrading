import 'package:cardtrading/ui/authentication/mobile/helper/sign_in_text_field.dart';
import 'package:cardtrading/ui/home_screen/home_screen.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:cardtrading/ui/utils/widget/common_text.dart';
import 'package:cardtrading/ui/utils/widget/common_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInMobile extends StatelessWidget {
  const SignInMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
        title: Text(
          AppStrings.keySignIn,
          style: TextStyles.bold.copyWith(fontSize: 16.sp),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 0.6.sw,
                    child: const CommonTitle(
                      text: AppStrings.keySignInTitle,
                      weight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 0.9.sw,
                    child: CommonText(
                      text: AppStrings.keySignInContent,
                      textStyles: TextStyles.regular.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const SignInTextField(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: CommonButton(
              buttonPadding: const EdgeInsets.all(8.0),
              prefixWidget: Text(
                AppStrings.keyGetOtp,
                style: TextStyles.semiBold.copyWith(
                  color: AppColors.selectedButtonText,
                  fontSize: 16.sp,
                ),
              ),
              buttonText: '',
              suffixWidget: const Icon(
                Icons.arrow_forward_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

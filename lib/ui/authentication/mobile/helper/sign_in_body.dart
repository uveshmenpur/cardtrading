import 'package:cardtrading/ui/authentication/mobile/helper/sign_in_button.dart';
import 'package:cardtrading/ui/authentication/mobile/helper/sign_in_text_field.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInBodyWidget extends StatelessWidget {
  const SignInBodyWidget({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 0.6.sw,
                      child: Text(
                        AppStrings.keySignInTitle,
                        style: TextStyles.medium.copyWith(
                          fontSize: 18.sp,
                          color: AppColors.golden,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 0.9.sw,
                      child: Text(
                        AppStrings.keySignInContent,
                        style: TextStyles.regular.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.checkoutTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),

                    ///Enter Phone Number Text Fields
                    const SignInTextField(),
                  ],
                ),
              ),
            ),
          ),
          SignInButton(formKey: formKey),
        ],
      ),
    );
  }
}

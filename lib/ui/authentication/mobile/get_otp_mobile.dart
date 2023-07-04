import 'package:cardtrading/ui/authentication/sign_in.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:cardtrading/ui/utils/widget/common_text.dart';
import 'package:cardtrading/ui/utils/widget/common_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class GetOtpMobile extends StatelessWidget {
  const GetOtpMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.keyVerification,
          style: TextStyles.bold.copyWith(fontSize: 16.sp),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.background,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    width: 0.5.sw,
                    child: CommonTitle(
                      text: AppStrings.keyEnterOtpHere,
                      fontSize: 18.sp,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    width: 0.8.sw,
                    child: CommonText(
                      text:
                      AppStrings.keyWeHaveSentYouOtp,
                      textStyles: TextStyles.regular
                          .copyWith(fontSize: 12.sp, color: AppColors.greyText),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
                    child: PinCodeTextField(
                      length: 6,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.scale,
                      hintCharacter: ' ',
                      cursorColor: AppColors.greyText,
                      hintStyle: TextStyles.regular
                          .copyWith(color: AppColors.greyText, fontSize: 26.sp),
                      pinTheme: PinTheme(
                        activeColor: AppColors.buttonBg,
                        inactiveFillColor: AppColors.buttonBg,
                        activeFillColor: AppColors.buttonBg,
                        selectedColor: AppColors.buttonBg,
                        selectedFillColor: AppColors.buttonBg,
                        inactiveColor: AppColors.buttonBg,
                        fieldHeight: 42.w,
                        fieldWidth: 42.w,
                      ),
                      enableActiveFill: true,
                      onCompleted: (v) {},
                      onChanged: (value) {

                      },
                      beforeTextPaste: (text) {
                        return true;
                      },
                      appContext: context,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: AppStrings.keyCodeNotReceived,
                            style: TextStyles.regular.copyWith(
                              fontFamily: 'Sora',
                            ),
                            children: [
                              TextSpan(
                                text: AppStrings.keyResend,
                                style: TextStyles.regular.copyWith(
                                    fontSize: 14,
                                    color: AppColors.primary,
                                    fontFamily: 'Sora'),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          AppStrings.keyTimer,
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: CommonButton(
              buttonPadding: const EdgeInsets.all(8.0),
              prefixWidget: Text(AppStrings.keyVerifyOtp,
                  style: TextStyles.semiBold.copyWith(
                    color: AppColors.selectedButtonText,
                    fontSize: 16.sp,
                  )),
              buttonText: ' ',
              suffixWidget: const Icon(
                Icons.arrow_forward_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignIn();
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

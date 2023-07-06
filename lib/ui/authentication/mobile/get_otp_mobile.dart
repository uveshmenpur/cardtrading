import 'dart:async';

import 'package:cardtrading/ui/complete_your_profile/complete_profile.dart';
import 'package:cardtrading/ui/onboarding/onboarding.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:cardtrading/ui/utils/widget/common_text.dart';
import 'package:cardtrading/ui/utils/widget/common_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class GetOtpMobile extends StatefulWidget {
  const GetOtpMobile({super.key});

  @override
  State<GetOtpMobile> createState() => _GetOtpMobileState();
}

class _GetOtpMobileState extends State<GetOtpMobile> {
  int _countDown = 8;
  late Timer timer;


  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countDown > 0) {
        setState(() {
          _countDown--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.keyVerification,
          style: TextStyles.medium.copyWith(
            fontSize: 16.sp,
            color: AppColors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const OnBoardingOne();
                },
              ),
            );
          },
          icon: SvgPicture.asset(
            '${AppAssets.svgLocation}arrow_right_line.svg',
            width: 24.w,
            height: 24.h,
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
                      tStyle: TextStyles.medium.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.golden,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    width: 0.8.sw,
                    child: CommonText(
                      text: AppStrings.keyWeHaveSentYouOtp,
                      textStyles: TextStyles.regular.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.checkoutTextColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
                    ///Pin Code Text Fields
                    child: _pinCodeTextField(context),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.keyCodeNotReceived,
                          style: TextStyles.light.copyWith(
                            fontFamily: 'Sora',
                            fontSize: 12.sp,
                            color: AppColors.checkoutTextColor,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _countDown = 8;
                              startTimer();
                            });
                          },
                          child: Visibility(
                            visible: _countDown == 0,
                            child: Text(
                              AppStrings.keyResend,
                              style: TextStyles.semiBold.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.primary,
                                  fontFamily: 'Sora'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            _countDown.toString().length >= 2
                                ? _countDown.toString().padLeft(3, '00:')
                                : _countDown.toString().padLeft(2, '00:0'),
                            textAlign: TextAlign.end,
                          ),
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
            child: _commonButton(context),
          ),
        ],
      ),
    );
  }

  ///Pin code Text Fields
  Widget _pinCodeTextField(BuildContext context) {
    return PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.scale,
                    hintCharacter: ' ',
                    cursorColor: AppColors.primary,
                    cursorHeight: 20.h,
                    textStyle: TextStyles.light.copyWith(
                      fontSize: 15.sp,
                      color: AppColors.white,
                      fontFamily: 'Sora',
                    ),
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
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      return true;
                    },
                    appContext: context,
                  );
  }

  ///Common Button
  Widget _commonButton(BuildContext context) {
    return CommonButton(
            buttonPadding: const EdgeInsets.all(8.0),
            prefixWidget: Text(
              AppStrings.keyVerifyOtp,
              style: TextStyles.semiBold.copyWith(
                color: AppColors.selectedButtonText,
                fontSize: 16.sp,
              ),
            ),
            buttonText: ' ',
            suffixWidget: const Icon(
              Icons.arrow_forward_outlined,
              color: AppColors.selectedButtonText,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CompleteProfile();
                  },
                ),
              );
            },
          );
  }
}

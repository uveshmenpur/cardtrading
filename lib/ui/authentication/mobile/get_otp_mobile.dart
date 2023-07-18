import 'package:cardtrading/framework/controllers/authentication/get_otp_controller.dart';
import 'package:cardtrading/ui/complete_your_profile/complete_profile.dart';
import 'package:cardtrading/ui/onboarding/onboarding.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:cardtrading/ui/utils/widget/common_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class GetOtpMobile extends ConsumerStatefulWidget {
  const GetOtpMobile({super.key});

  @override
  ConsumerState<GetOtpMobile> createState() => _GetOtpMobileState();
}

class _GetOtpMobileState extends ConsumerState<GetOtpMobile>{
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final getOtpWatch = ref.watch(getOtpController);
      getOtpWatch.startTimer();
    });
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
      body: _bodyWidget(context),
    );
  }

  ///Body Widget
  Widget _bodyWidget(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
                    child: Text(
                      AppStrings.keyWeHaveSentYouOtp,
                      style: TextStyles.regular.copyWith(
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
                        Consumer(
                          builder: (BuildContext context, WidgetRef ref,
                              Widget? child) {
                            final getOtpWatch = ref.watch(getOtpController);
                            return InkWell(
                              onTap: () {
                                getOtpWatch.changeCount(60);
                                getOtpWatch.startTimer();
                              },
                              child: Visibility(
                                visible: getOtpWatch.countDown == 0,
                                child: Text(
                                  AppStrings.keyResend,
                                  style: TextStyles.semiBold.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.primary,
                                      fontFamily: 'Sora'),
                                ),
                              ),
                            );
                          },
                        ),
                        Consumer(
                          builder: (BuildContext context, WidgetRef ref,
                              Widget? child) {
                            final getOtpRead = ref.watch(getOtpController);
                            return Expanded(
                              child: Text(
                                getOtpRead.countDown.toString().length >= 2
                                    ? getOtpRead.countDown
                                        .toString()
                                        .padLeft(3, '00:')
                                    : getOtpRead.countDown
                                        .toString()
                                        .padLeft(2, '00:0'),
                                textAlign: TextAlign.end,
                              ),
                            );
                          },
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
      validator: (value) {
        try {
          if (value?.length != 6) {
            return 'Enter Valid OTP';
          } else {
            return null;
          }
        } catch (e) {
          if (value?.length != 6) {
            return 'Enter Valid OTP';
          } else {
            return 'Enter Valid OTP';
          }
        }
      },
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
        if (_formKey.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const CompleteProfile();
              },
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Enter Valid OTP')),
          );
        }
      },
    );
  }
}


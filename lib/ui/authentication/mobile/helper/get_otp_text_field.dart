import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class GetOtpTextField extends StatelessWidget {
  const GetOtpTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      validator: (value) {
        if (value?.length != 6) {
          return 'Enter Valid OTP';
        } else {
          return null;
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
}

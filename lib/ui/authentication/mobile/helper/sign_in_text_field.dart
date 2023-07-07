import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInTextField extends StatelessWidget {
  const SignInTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onTapOutside: (pointer) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (value){
          if(value?.length != 10){
            return 'Enter Valid Phone Number';
          }
          return null;
        },
        keyboardType: TextInputType.phone,
        maxLength: 10,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          hintText: AppStrings.keyHintText,
          hintStyle: TextStyles.light
              .copyWith(fontFamily: 'Sora', color: AppColors.buttonText),
          counterText: '',
          prefixIcon: Padding(
            padding: EdgeInsets.all(18.w),
            child: Text(
              '+965',
              style: TextStyles.light.copyWith(
                fontFamily: TextStyles.secondaryFontFamily,
                fontSize: 14.sp,
                color: AppColors.buttonText,
              ),
            ),
          ),
          fillColor: AppColors.buttonBg,
          filled: true,
          contentPadding:
              EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

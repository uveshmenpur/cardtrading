import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:flutter/material.dart';
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
        onTapOutside: (pointer){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        keyboardType: TextInputType.phone,
        maxLength: 10,
        decoration: InputDecoration(
          hintText: 'XXXXX-XXXXX',
          prefix: const Padding(
            padding: EdgeInsets.fromLTRB(0.0,8.0,8.0,8.0),
            child: Text('+965'),
          ),
          fillColor: AppColors.buttonBg,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 8.0.h,horizontal: 16.0.w),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
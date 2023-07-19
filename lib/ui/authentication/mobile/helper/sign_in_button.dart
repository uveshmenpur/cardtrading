import 'package:cardtrading/ui/authentication/get_otp.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 25.0.h),
      child: CommonButton(
        buttonPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        buttonHeight: 54.h,
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
          if (formKey.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const GetOtp();
                },
              ),
            );
          }
        },
      ),
    );
  }
}

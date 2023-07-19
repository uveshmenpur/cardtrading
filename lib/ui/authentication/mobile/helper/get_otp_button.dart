import 'package:cardtrading/ui/complete_your_profile/complete_profile.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class GetOtpButton extends StatelessWidget {
  const GetOtpButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
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
        if (formKey.currentState!.validate()) {
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

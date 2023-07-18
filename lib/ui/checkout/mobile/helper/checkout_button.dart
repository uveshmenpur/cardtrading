
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.h,
      width: 261.w,
      child: CommonButton(
        buttonText: '',
        prefixWidget: Text(
          AppStrings.keyCheckout,
          style: TextStyles.semiBold.copyWith(
              fontSize: 16.sp,
              color: AppColors.dividerColor),
        ),
        buttonPadding:
        const EdgeInsets.symmetric(horizontal: 20),
        buttonBackgroundColor: AppColors.primary,
        suffixWidget: const Icon(
          Icons.arrow_forward,
          color: AppColors.dividerColor,
        ),
      ),
    );
  }
}

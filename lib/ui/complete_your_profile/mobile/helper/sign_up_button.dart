import 'package:cardtrading/framework/controllers/complete_your_profile/complete_profile_controller.dart';
import 'package:cardtrading/ui/home_screen/home_screen.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Consumer(
          builder: (BuildContext context,WidgetRef ref,Widget? widget) {
            final completeProfileWatch = ref.watch(completeProfileController);
            return CommonButton(
              buttonPadding: const EdgeInsets.all(8.0),
              prefixWidget: Text(
                AppStrings.keySignUp,
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
                if (completeProfileWatch.secondPageFormKey.currentState!
                    .validate()) {
                  completeProfileWatch.secondPageFormKey.currentState!
                      .save();
                  completeProfileWatch.resetPage();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomeScreen();
                      },
                    ),
                  );
                }
              },
            );
          }
      ),
    );
  }
}

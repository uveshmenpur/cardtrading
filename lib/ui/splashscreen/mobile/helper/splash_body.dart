import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.keyCard,
            style: TextStyles.bold.copyWith(
              color: AppColors.primary,
              fontSize: 50.sp,
            ),
          ),
          Text(
            AppStrings.keyBuyAndSell,
            style: TextStyles.medium.copyWith(
                color: AppColors.white,
                fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}

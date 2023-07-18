import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenDivider extends StatelessWidget {
  const HomeScreenDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Divider(
        thickness: 1.5.h,
        color: AppColors.dividerColor,
      ),
    );
  }
}

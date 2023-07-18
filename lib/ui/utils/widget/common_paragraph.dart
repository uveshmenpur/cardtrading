import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonParagraph extends StatelessWidget {
  const CommonParagraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.keyCommonParagraphTitle,
            style: TextStyles.regular.copyWith(
              fontFamily: 'Sora',
              color: AppColors.white,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            AppStrings.keyCommonParagraphContent,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.light.copyWith(
              fontSize: 12.sp,
              fontFamily: 'Sora',
              color: AppColors.greyText,
            ),
          ),
        ],
      ),
    );
  }
}

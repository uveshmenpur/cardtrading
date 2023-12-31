import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenDescription extends StatelessWidget {
  const HomeScreenDescription({super.key, required this.title,this.onTap});
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.regular
                .copyWith(color: AppColors.golden, fontSize: 16.sp),
          ),
          InkWell(
            onTap: onTap ?? (){},
            child: Text(
              AppStrings.keySeeAll,
              style:
              TextStyles.regular.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenProfiles extends StatelessWidget {
  const HomeScreenProfiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      height: 120.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Column(
              children: [
                Flexible(
                  child: SizedBox(
                    width: 56.w,
                    height: 56.h,
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundImage: AssetImage(
                          '${AppAssets.imgLocation}profile_${index % 5}.png'),
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 56.w,
                    child: Text(
                      AppStrings.profiles[index % 5],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.regular.copyWith(
                        color: AppColors.greyText,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}

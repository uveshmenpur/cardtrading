import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedSellerBody extends StatelessWidget {
  const FeaturedSellerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {},
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.0.w),
                width: 64.w,
                height: 64.h,
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundImage: AssetImage(
                      '${AppAssets.imgLocation}profile_${index % 5}.png'),
                ),
              ),
              Text(
                AppStrings.profiles[index % 5],
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.regular.copyWith(
                  color: AppColors.greyText,
                  fontSize: 12.sp,
                  fontFamily: 'Sora',
                ),
              ),
            ],
          ),
        );
      },
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 1.0,
          color: AppColors.indicatorColor,
        );
      },
    );
  }
}

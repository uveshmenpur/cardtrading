import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenProfiles extends StatelessWidget {
  const HomeScreenProfiles({super.key});

  static const List profiles = [
    AppStrings.keyShoheiOhtani,
    AppStrings.keyAnthonyVolpe,
    AppStrings.keyGengerDolby,
    AppStrings.keyJordanWalker,
    AppStrings.keyRandyJohnson
  ];

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        height: 120.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 56.w,
                    height: 56.h,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          '${AppAssets.imgLocation}profile_${index % 5}.png'),
                    ),
                  ),
                  SizedBox(
                    width: 56.w,
                    child: Text(
                      profiles[index % 5],
                      maxLines: 2,
                      style: TextStyles.regular
                          .copyWith(color: AppColors.greyText),
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

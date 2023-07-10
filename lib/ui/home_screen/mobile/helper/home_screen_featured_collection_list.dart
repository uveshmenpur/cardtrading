import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenFeaturedCollectionList extends StatelessWidget {
  const HomeScreenFeaturedCollectionList({super.key});

  final int count = 10;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 427.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 8.0.h),
            child: Column(
              children: [
                SizedBox(
                  width: 0.9.sw,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      index == 0
                          ? const CommonTitle(text: AppStrings.keyFeaturedCollection)
                          : const Text(''),
                      RichText(
                        text: TextSpan(
                          text: index < 9 ? '0${index + 1}' : '${index + 1}',
                          style: TextStyles.regular
                              .copyWith(color: AppColors.primary),
                          children: [
                            TextSpan(
                              text: '/$count',
                              style: TextStyles.regular
                                  .copyWith(color: AppColors.greyText),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      index == 1 ?'${AppAssets.imgLocation}card_1.png' :'${AppAssets.imgLocation}card_0.png',
                      width: 178.w,
                      height: 300.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  width: 0.9.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 0.4.sw,
                            child: Text(
                              AppStrings.key1993,
                              softWrap: true,
                              maxLines: 2,
                              style: TextStyles.regular
                                  .copyWith(color: AppColors.white, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'PSA 5',
                            style: TextStyles.regular
                                .copyWith(color: AppColors.golden, fontSize: 16),
                          ),
                          Text(
                            '\$300.10',
                            style: TextStyles.regular
                                .copyWith(color: AppColors.primary),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

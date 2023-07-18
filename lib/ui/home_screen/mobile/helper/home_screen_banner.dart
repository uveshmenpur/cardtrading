import 'package:banner_carousel/banner_carousel.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: BannerCarousel(
        viewportFraction: 1.0,
        height: 150.h,
        showIndicator: false,
        initialPage: 1,
        customizedBanners: [
          ...List.generate(
            3,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    SizedBox(
                      width: 0.9.sw,
                      height: 0.4.sh,
                      child: Image.network(
                        'http://cloud1.kodyinfotech.com:7000/online-test-management/public/uploads/media/20f89daadc90b1c4df3418dc1fa53e99.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 51.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 5.h),
                        color: index == 1 ? AppColors.white : AppColors.primary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: AppStrings.keyBuy,
                                      style: TextStyles.bold.copyWith(
                                        fontFamily:
                                            TextStyles.secondaryFontFamily,
                                        fontSize: 12.sp,
                                        overflow: TextOverflow.ellipsis,
                                        color: AppColors.background,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: AppStrings.keyWith,
                                          style: TextStyles.regular.copyWith(
                                            fontFamily:
                                                TextStyles.secondaryFontFamily,
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 12.sp,
                                            color: AppColors.background,
                                          ),
                                        ),
                                        TextSpan(
                                          text: AppStrings.keyConfidence,
                                          style: TextStyles.bold.copyWith(
                                            fontFamily:
                                                TextStyles.secondaryFontFamily,
                                            fontSize: 12.sp,
                                            overflow: TextOverflow.ellipsis,
                                            color: AppColors.background,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    AppStrings.keyBannerSubtitle,
                                    style: TextStyles.light.copyWith(
                                      fontFamily:
                                          TextStyles.secondaryFontFamily,
                                      fontSize: 8.sp,
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.background,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SvgPicture.asset(
                                '${AppAssets.svgLocation}arrow_up.svg'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

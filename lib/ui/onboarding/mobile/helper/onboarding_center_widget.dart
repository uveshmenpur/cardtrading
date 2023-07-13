import 'package:cardtrading/framework/controllers/onboarding/onboarding_controller.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingCenterWidget extends StatelessWidget {
  const OnBoardingCenterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final onBoardingWatch = ref.watch(onBoardingController);
        return Column(
          children: [
            SizedBox(
              height: 0.7.sh,
              child: PageView(
                onPageChanged: (pageIndex) {
                  onBoardingWatch.changePage(pageIndex);
                },
                controller: onBoardingWatch.pageController,
                children: List.generate(onBoardingWatch.onBoardingTitle.length,
                    (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        onBoardingWatch.onBoardingTitle[index],
                        maxLines: 2,
                        style: TextStyles.semiBold.copyWith(
                          fontSize: 24.sp,
                          color: AppColors.golden,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        onBoardingWatch.onBoardingContent[index],
                        maxLines: 2,
                        style: TextStyles.regular.copyWith(
                          color: AppColors.greyText,
                        ),
                        softWrap: true,
                      ),
                    ],
                  );
                }),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        );
      },
    );
  }
}

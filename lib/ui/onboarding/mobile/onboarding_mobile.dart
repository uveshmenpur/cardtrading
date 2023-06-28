import 'package:cardtrading/ui/home_screen/home_screen.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slider_button/slider_button.dart';

class OnBoardingMobile extends StatefulWidget {
  const OnBoardingMobile({super.key});

  @override
  State<OnBoardingMobile> createState() => _OnBoardingMobileState();
}

class _OnBoardingMobileState extends State<OnBoardingMobile> {
  PageController pageController = PageController(initialPage: 0);

  int selectedPage = 0;

  List<String> onBoardingTitle = [
    AppStrings.keyOnBoardingTitle1,
    AppStrings.keyOnBoardingTitle2,
    AppStrings.keyOnBoardingTitle3
  ];
  List<String> onBoardingContent = [
    AppStrings.keyOnBoardingContent1,
    AppStrings.keyOnBoardingContent2,
    AppStrings.keyOnBoardingContent3
  ];

  animateToNextPage() {
    pageController.animateToPage(
      selectedPage,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: selectedPage != 2
                              ? Text(
                                  AppStrings.keySkip,
                                  textAlign: TextAlign.start,
                                  style: TextStyles.regular.copyWith(
                                    color: AppColors.greyText,
                                    fontSize: 14.sp,
                                  ),
                                )
                              : const SizedBox(),
                          onPressed: () {
                            setState(() {
                              selectedPage = onBoardingTitle.length - 1;
                              animateToNextPage();
                            });
                          },
                        ),
                      ],
                    ),

                    ///space left out for animation will implement when I get json file from designer
                    SizedBox(
                      height: 0.7.sh,
                      child: PageView(
                        onPageChanged: (pageIndex) {
                          setState(() {
                            selectedPage = pageIndex;
                          });
                        },
                        controller: pageController,
                        children:
                            List.generate(onBoardingTitle.length, (index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 0.5.sh),
                              Text(
                                onBoardingTitle[index],
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: TextStyles.bold.copyWith(
                                  fontSize: 24.sp,
                                  color: AppColors.golden,
                                ),
                              ),
                              Text(
                                onBoardingContent[index],
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: TextStyles.regular.copyWith(
                                  fontSize: 14.sp,
                                  color: AppColors.greyText,
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: List.generate(
                        onBoardingTitle.length,
                        (index) {
                          return Container(
                            margin: EdgeInsets.only(right: 5.w),
                            height: 6.h,
                            width: selectedPage == index ? 20.w : 6.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: selectedPage == index
                                    ? AppColors.primary
                                    : Colors.transparent,
                              ),
                              color: selectedPage == index
                                  ? Colors.transparent
                                  : AppColors.indicatorColor,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            selectedPage == 2
                ? SliderButton(
                    backgroundColor: AppColors.background,
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const HomeScreen();
                          },
                        ),
                      );
                    },
                    radius: 10.r,
                    highlightedColor: AppColors.primary,
                    baseColor: AppColors.primary,
                    label: Text(
                      AppStrings.keySwipeToGetStarted,
                      textAlign: TextAlign.center,
                      style: TextStyles.medium
                          .copyWith(color: AppColors.primary, fontSize: 16.sp),
                    ),
                    child: Container(
                      color: AppColors.background,
                      child: SvgPicture.asset(
                        '${AppAssets.svgLocation}swipeicon.svg',
                        matchTextDirection: true,
                      ),
                    ),
                  )

                ///If we are on 1st or 2nd on-boarding screen than display Next Button
                : SizedBox(
                    height: 42.h,
                    width: 0.9.sw,
                    child: Center(
                      child: CommonButton(
                        buttonText: AppStrings.keyNext,
                        onPressed: () {
                          setState(
                            () {
                              selectedPage++;
                              animateToNextPage();
                            },
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),

      ///If we are oon third on-boarding screen than display Slider Button
    );
  }
}

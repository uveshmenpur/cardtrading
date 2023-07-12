import 'package:cardtrading/framework/controllers/onboarding/onboarding_controller.dart';
import 'package:cardtrading/ui/authentication/sign_in.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final onBoardingWatch = ref.watch(onBoardingController);
          return _bodyWidget(context,onBoardingWatch);
        },
      ),
    );
  }

  ///Body Widget
  Widget _bodyWidget(BuildContext context,OnBoardingController onBoardingWatch) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.h,
                ),

                ///Skip Button
                _skipButton(onBoardingWatch),

                ///space left out for animation will implement when I get json file from designer
                SizedBox(
                  height: 0.7.sh,
                  child: PageView(
                    onPageChanged: (pageIndex) {
                      setState(
                            () {
                          onBoardingWatch.changePage(pageIndex);
                        },
                      );
                    },
                    controller: pageController,
                    children: List.generate(
                        onBoardingWatch.onBoardingTitle.length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Container(),),
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

                ///Page Indicator Boxes
                _pageIndicator(onBoardingWatch),
              ],
            ),
          ),

          ///Display Common Button on first 2 pages and Slider on 3rd page
          onBoardingWatch.selectedPage == 2 ? _sliderButton(context,onBoardingWatch) : _commonButton(onBoardingWatch),
        ],
      ),
    );
  }

  Row _skipButton(OnBoardingController onBoardingWatch) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          child: onBoardingWatch.selectedPage != 2
              ? Text(
            AppStrings.keySkip,
            textAlign: TextAlign.start,
            style: TextStyles.light.copyWith(
              color: AppColors.checkoutTextColor,
            ),
          )
              : const SizedBox(),
          onPressed: () {
            setState(() {
              onBoardingWatch.changePage(onBoardingWatch.onBoardingTitle.length - 1);
              onBoardingWatch.animateToNextPage(pageController);
            });
          },
        ),
      ],
    );
  }

  ///Common Button
  Widget _commonButton(OnBoardingController onBoardingWatch) {
    return CommonButton(
      buttonHeight: 50.h,
      buttonText: AppStrings.keyNext,
      buttonTextStyle: TextStyles.semiBold.copyWith(
        fontSize: 16.sp,
        color: AppColors.selectedButtonText,
      ),
      onPressed: () {
        setState(
              () {
            onBoardingWatch.increment();
            onBoardingWatch.animateToNextPage(pageController);
          },
        );
      },
    );
  }

  ///Slider Button
  Widget _sliderButton(BuildContext context, OnBoardingController onBoardingWatch) {
    return SliderButton(
      backgroundColor: AppColors.background,
      width: double.infinity,
      action: () {
        onBoardingWatch.changePage(0);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const SignIn();
            },
          ),
        );
      },
      alignLabel: Alignment.center,
      highlightedColor: AppColors.primary,
      baseColor: AppColors.primary,
      label: Text(
        AppStrings.keySwipeToGetStarted,
        textAlign: TextAlign.center,
        style: TextStyles.semiBold.copyWith(
          color: AppColors.primary,
          fontSize: 16.sp,
        ),
      ),
      child: Container(
        color: Colors.transparent,
        child: SvgPicture.asset(
          '${AppAssets.svgLocation}swipeicon.svg',
          matchTextDirection: true,
        ),
      ),
    );
  }

  ///Page Indicators
  Widget _pageIndicator(OnBoardingController onBoardingWatch) {
    return Row(
      children: List.generate(
        onBoardingWatch.onBoardingTitle.length,
            (index) {
          return Container(
            margin: EdgeInsets.only(right: 5.w),
            height: 6.h,
            width: onBoardingWatch.selectedPage == index ? 20.w : 6.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: onBoardingWatch.selectedPage == index
                    ? AppColors.primary
                    : Colors.transparent,
              ),
              color: onBoardingWatch.selectedPage == index
                  ? Colors.transparent
                  : AppColors.indicatorColor,
            ),
          );
        },
      ),
    );
  }
}

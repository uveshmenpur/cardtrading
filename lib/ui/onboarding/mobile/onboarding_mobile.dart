import 'package:cardtrading/ui/authentication/sign_in.dart';
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
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _bodyWidget(context),
    );
  }

  ///Body Widget
  Widget _bodyWidget(BuildContext context) {
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
                _skipButton(),

                ///space left out for animation will implement when I get json file from designer
                SizedBox(
                  height: 0.7.sh,
                  child: PageView(
                    onPageChanged: (pageIndex) {
                      setState(
                        () {
                          selectedPage = pageIndex;
                        },
                      );
                    },
                    controller: pageController,
                    children: List.generate(onBoardingTitle.length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Container(),),
                          Text(
                            onBoardingTitle[index],
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
                            onBoardingContent[index],
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
                _pageIndicator(),
              ],
            ),
          ),

          ///Display Common Button on first 2 pages and Slider on 3rd page
          selectedPage == 2 ? _sliderButton(context) : _commonButton(),
        ],
      ),
    );
  }

  Row _skipButton() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: selectedPage != 2
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
                        selectedPage = onBoardingTitle.length - 1;
                        animateToNextPage();
                      });
                    },
                  ),
                ],
              );
  }

  ///Common Button
  Widget _commonButton() {
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
            selectedPage++;
            animateToNextPage();
          },
        );
      },
    );
  }

  ///Slider Button
  Widget _sliderButton(BuildContext context) {
    return SliderButton(
      backgroundColor: AppColors.background,
      width: double.infinity,
      action: () {
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
  Widget _pageIndicator() {
    return Row(
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
    );
  }
}

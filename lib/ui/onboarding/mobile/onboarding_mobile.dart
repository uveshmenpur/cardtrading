import 'package:cardtrading/ui/authentication/sign_in.dart';
import 'package:cardtrading/ui/utils/colors.dart';
import 'package:cardtrading/ui/utils/my_strings.dart';
import 'package:cardtrading/ui/utils/text_style.dart';
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
  int initialPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 0.9.sw,
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    child: initialPage != 3
                        ? Text('Skip',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: MyColors.greyText,
                          fontSize: 12.sp,
                        ))
                        : const Text(''),
                    onPressed: () {
                      setState(() {
                        initialPage = 3;
                      });
                    },
                  ),
                ],
              ),

              ///space left out for animation will implement when I get json file from designer
              SizedBox(
                width: 0.9.sw,
                height: 0.6.sh,
              ),
              Container(
                width: 0.7.sw,
                padding: REdgeInsets.all(8.0.r),
                child: Text(
                  initialPage == 1
                      ? MyStrings.onBoardingOneTitle
                      : initialPage == 2
                          ? MyStrings.onBoardingTwoTitle
                          : MyStrings.onBoardingThreeTitle,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: TextStyle(
                      fontFamily: TextStyles.fontFamily,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: MyColors.golden),
                ),
              ),
              Container(
                width: 0.8.sw,
                padding: REdgeInsets.all(8.0.r),
                child: Text(
                  initialPage == 1
                      ? MyStrings.onBoardingOneContent
                      : initialPage == 2
                          ? MyStrings.onBoardingTwoContent
                          : MyStrings.onBoardingThreeContent,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: TextStyle(
                      fontFamily: TextStyles.fontFamily,
                      fontSize: 12.sp,
                      color: MyColors.greyText),
                ),
              ),
              SizedBox(
                width: 0.9.sw,
                height: 10.h,
              ),
              Padding(
                padding: REdgeInsets.all(8.0.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: REdgeInsets.only(right: 4.0.r),
                      child: Container(
                        width: 5.w,
                        height: 5.w,
                        color: initialPage == 1 ? null : MyColors.indicator,
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.only(right: 4.0.r),
                      child: Container(
                        width: 5.w,
                        height: 5.w,
                        color: initialPage == 2 ? null : MyColors.indicator,
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.only(right: 4.0.r),
                      child: Container(
                        width: 5.w,
                        height: 5.w,
                        color: initialPage == 3 ? null : MyColors.indicator,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton:

          ///If we are oon third on-boarding screen than display Slider Button
          initialPage == 3
              ? SliderButton(
                  backgroundColor: MyColors.background,
                  action: () {
                    initialPage = 1;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const SignIn();
                        },
                      ),
                    );
                  },
                  radius: 10,
                  highlightedColor: MyColors.primary,
                  baseColor: MyColors.primary,
                  label: Text(
                    'Swipe to get started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: MyColors.primary,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                        fontSize: 16.sp),
                  ),
                  child: Container(
                    color: MyColors.background,
                    child: SvgPicture.asset(
                      'assets/svg/swipeicon.svg',
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
                      text: 'Next',
                      onPressed: () {
                        setState(() {
                          initialPage == 1 ? initialPage = 2 : initialPage = 3;
                        },);
                      },
                    ),
                  ),
                ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

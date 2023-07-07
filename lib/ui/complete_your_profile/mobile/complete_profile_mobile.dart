import 'package:cardtrading/ui/complete_your_profile/add_address.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompleteProfileMobile extends StatefulWidget {
  const CompleteProfileMobile({super.key});

  @override
  State<CompleteProfileMobile> createState() => _CompleteProfileMobileState();
}

class _CompleteProfileMobileState extends State<CompleteProfileMobile> {
  bool haveReferral = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppStrings.keyCompleteYourProfile,
          style: TextStyles.medium.copyWith(
            fontSize: 16.sp,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              '${AppAssets.svgLocation}arrow_right_line.svg',
              width: 16.w,
              height: 16.h,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: 180,
                          child: Text(
                            AppStrings.keyEnterYourPersonalDetails,
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyles.medium.copyWith(
                              fontSize: 18.sp,
                              color: AppColors.golden,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      ...List.generate(
                        2,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              width: 8.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                border: index == 1
                                    ? Border.all(
                                        color: AppColors.indicatorColor,
                                      )
                                    : null,
                                color: index == 0
                                    ? AppColors.primary
                                    : Colors.transparent,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    AppStrings.keyCompleteYourProfileContent,
                    style: TextStyles.regular.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.checkoutTextColor,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  TextFormField(
                    cursorColor: AppColors.primary,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(18.0),
                      hintText: AppStrings.keyUsername,
                      fillColor: AppColors.buttonBg,
                      filled: true,
                      hintStyle: TextStyles.light.copyWith(
                        fontFamily: 'Sora',
                        color: AppColors.buttonText,
                        backgroundColor: AppColors.buttonBg,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          haveReferral = true;
                        },
                      );
                    },
                    child: Text(
                      AppStrings.keyHaveReferral,
                      style: TextStyles.light.copyWith(
                        fontFamily: 'Sora',
                        color: AppColors.primary,
                        fontSize: 12.sp,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Visibility(
                    visible: haveReferral,
                    child: TextFormField(
                      cursorColor: AppColors.primary,
                      decoration: InputDecoration(
                        hintText: AppStrings.keyEnterReferral,
                        fillColor: AppColors.buttonBg,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 20.0),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(
                              () {
                                haveReferral = false;
                              },
                            );
                          },
                          child: Container(
                            width: 87.w,
                            height: 54.h,
                            padding: EdgeInsets.zero,
                            color: AppColors.primary,
                            child: Center(
                              child: Text(
                                AppStrings.keyApply,
                                textAlign: TextAlign.center,
                                style: TextStyles.regular.copyWith(
                                  fontSize: 12.sp,
                                  fontFamily: 'Sora',
                                  backgroundColor: AppColors.primary,
                                  color: AppColors.selectedButtonText,
                                ),
                              ),
                            ),
                          ),
                        ),
                        hintStyle: TextStyles.light.copyWith(
                          fontFamily: 'Sora',
                          color: AppColors.buttonText,
                          backgroundColor: AppColors.buttonBg,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: CommonButton(
                buttonPadding: const EdgeInsets.all(8.0),
                prefixWidget: Text(
                  AppStrings.keyNext,
                  style: TextStyles.semiBold.copyWith(
                    color: AppColors.selectedButtonText,
                    fontSize: 16.sp,
                  ),
                ),
                buttonText: ' ',
                suffixWidget: const Icon(
                  Icons.arrow_forward_outlined,
                  color: AppColors.selectedButtonText,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AddAddress();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

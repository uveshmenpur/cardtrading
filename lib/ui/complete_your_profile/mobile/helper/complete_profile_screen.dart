import 'package:cardtrading/framework/controllers/complete_your_profile/complete_profile_controller.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteYourProfile extends StatelessWidget {
  const CompleteYourProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? widget) {
        final completeProfileWatch = ref.watch(completeProfileController);
        return Form(
          key: completeProfileWatch.firstPageFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
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
                                padding: EdgeInsets.all(4.0.w),
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
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          return completeProfileWatch.validateEmail(value);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(18.0.w),
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
                          completeProfileWatch.addReferral();
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
                        visible: completeProfileWatch.hasReferral,
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
                                completeProfileWatch.hideReferral();
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
                      if (completeProfileWatch.firstPageFormKey.currentState!
                          .validate()) {
                        completeProfileWatch.firstPageFormKey.currentState!
                            .save();
                        completeProfileWatch.nextPage();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

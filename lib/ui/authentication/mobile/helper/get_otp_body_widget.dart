import 'package:cardtrading/framework/controllers/authentication/get_otp_controller.dart';
import 'package:cardtrading/ui/authentication/mobile/helper/get_otp_button.dart';
import 'package:cardtrading/ui/authentication/mobile/helper/get_otp_text_field.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class GetOtpBodyWidget extends StatelessWidget {
  const GetOtpBodyWidget({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    width: 0.5.sw,
                    child: CommonTitle(
                      text: AppStrings.keyEnterOtpHere,
                      tStyle: TextStyles.medium.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.golden,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    width: 0.8.sw,
                    child: Text(
                      AppStrings.keyWeHaveSentYouOtp,
                      style: TextStyles.regular.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.checkoutTextColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.0.w, 20.0.h, 8.0.w, 8.0.h),

                    ///Pin Code Text Fields
                    child: const GetOtpTextField(),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.keyCodeNotReceived,
                          style: TextStyles.light.copyWith(
                            fontFamily: 'Sora',
                            fontSize: 12.sp,
                            color: AppColors.checkoutTextColor,
                          ),
                        ),
                        Consumer(
                          builder: (BuildContext context, WidgetRef ref,
                              Widget? child) {
                            final getOtpWatch = ref.watch(getOtpController);
                            return InkWell(
                              onTap: () {
                                getOtpWatch.changeCount(60);
                                getOtpWatch.startTimer();
                              },
                              child: Visibility(
                                visible: getOtpWatch.countDown == 0,
                                child: Text(
                                  AppStrings.keyResend,
                                  style: TextStyles.semiBold.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.primary,
                                      fontFamily: 'Sora'),
                                ),
                              ),
                            );
                          },
                        ),
                        Consumer(
                          builder: (BuildContext context, WidgetRef ref,
                              Widget? child) {
                            final getOtpRead = ref.watch(getOtpController);
                            return Expanded(
                              child: Text(
                                getOtpRead.countDown.toString().length >= 2
                                    ? getOtpRead.countDown
                                    .toString()
                                    .padLeft(3, '00:')
                                    : getOtpRead.countDown
                                    .toString()
                                    .padLeft(2, '00:0'),
                                textAlign: TextAlign.end,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: GetOtpButton(formKey: formKey),
          ),
        ],
      ),
    );
  }
}

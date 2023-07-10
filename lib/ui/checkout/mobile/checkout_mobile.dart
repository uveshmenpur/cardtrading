import 'package:cardtrading/ui/checkout/mobile/helper/checkout_list.dart';
import 'package:cardtrading/ui/home_screen/home_screen.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutMobile extends StatelessWidget {
  const CheckoutMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.keyCart,
          style: TextStyles.medium.copyWith(fontSize: 16.sp),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.background,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...List.generate(
              2,
              (index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CheckoutList(url: '${AppAssets.imgLocation}card_0.png'),
                    Divider(
                      thickness: 1.h,
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                AppStrings.keyPaymentSummary,
                textAlign: TextAlign.start,
                style: TextStyles.regular.copyWith(
                  fontFamily: 'Sora',
                  color: AppColors.golden,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.keyTotalAmount,
                          style: TextStyles.regular.copyWith(
                            fontFamily: 'Sora',
                            fontSize: 12.sp,
                            color: AppColors.containerText,
                          ),
                        ),
                        Text(
                          AppStrings.keyTotalAmountValue,
                          style: TextStyles.regular.copyWith(
                            fontFamily: 'Sora',
                            fontSize: 12.sp,
                            color: AppColors.checkoutTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.keyDiscount,
                          style: TextStyles.regular.copyWith(
                            fontFamily: 'Sora',
                            fontSize: 12.sp,
                            color: AppColors.containerText,
                          ),
                        ),
                        Text(
                          AppStrings.keyDash,
                          style: TextStyles.regular.copyWith(
                            fontFamily: 'Sora',
                            fontSize: 12.sp,
                            color: AppColors.checkoutTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.keyDeliveryCharges,
                          style: TextStyles.regular.copyWith(
                            fontFamily: 'Sora',
                            fontSize: 12.sp,
                            color: AppColors.containerText,
                          ),
                        ),
                        Text(
                          AppStrings.keyDash,
                          style: TextStyles.regular.copyWith(
                            fontFamily: 'Sora',
                            fontSize: 12.sp,
                            color: AppColors.checkoutTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.keySubTotal,
                          style: TextStyles.semiBold.copyWith(
                            fontFamily: 'Sora',
                            fontSize: 12.sp,
                            color: AppColors.checkoutTextColor,
                          ),
                        ),
                        Text(
                          AppStrings.keySubTotalValue,
                          style: TextStyles.semiBold.copyWith(
                            fontFamily: 'Sora',
                            fontSize: 12.sp,
                            color: AppColors.checkoutTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 34.0),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 54.w,
                      height: 54.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primary)),
                      child: Center(
                        child: InkWell(
                          child: const Icon(
                            Icons.add,
                            color: AppColors.primary,
                            size: 24,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const HomeScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 54.h,
                      width: 261.w,
                      child: CommonButton(
                        buttonText: '',
                        prefixWidget: Text(
                          AppStrings.keyCheckout,
                          style: TextStyles.semiBold.copyWith(
                              fontSize: 16.sp, color: AppColors.dividerColor),
                        ),
                        buttonPadding: const EdgeInsets.symmetric(horizontal: 20),
                        buttonBackgroundColor: AppColors.primary,
                        suffixWidget: const Icon(
                          Icons.arrow_forward,
                          color: AppColors.dividerColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

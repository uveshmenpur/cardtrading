
import 'package:cardtrading/framework/controllers/checkout/checkout_controller.dart';
import 'package:cardtrading/ui/checkout/mobile/helper/add_other_card_button.dart';
import 'package:cardtrading/ui/checkout/mobile/helper/checkout_button.dart';
import 'package:cardtrading/ui/checkout/mobile/helper/checkout_list.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({
    super.key,
    required this.cartModel,
  });

  final CartModel? cartModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final checkoutWatch = ref.watch(checkoutController);
          if(cartModel != null){
            checkoutWatch.addCard(cartModel as CartModel);
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(
                checkoutWatch.cartList.length,
                    (index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CheckoutList(checkoutWatch.cartList[index], index, () {
                        checkoutWatch.deleteCardFromCartList(index);
                      }, url: '${AppAssets.imgLocation}card_0.png'),
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
                      padding: EdgeInsets.symmetric(vertical: 15.0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.keyDeliveryCharges,
                            style: TextStyles.regular.copyWith(
                              fontFamily: 'Sora',
                              fontSize: 12.sp,
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.containerText,
                            ),
                          ),
                          Text(
                            AppStrings.keyDash,
                            style: TextStyles.regular.copyWith(
                              fontFamily: 'Sora',
                              fontSize: 12.sp,
                              overflow: TextOverflow.ellipsis,
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
                      padding: EdgeInsets.symmetric(vertical: 15.0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.keySubTotal,
                            style: TextStyles.semiBold.copyWith(
                              fontFamily: 'Sora',
                              fontSize: 12.sp,
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.checkoutTextColor,
                            ),
                          ),
                          Text(
                            AppStrings.keySubTotalValue,
                            style: TextStyles.semiBold.copyWith(
                              fontFamily: 'Sora',
                              fontSize: 12.sp,
                              overflow: TextOverflow.ellipsis,
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
                padding: EdgeInsets.fromLTRB(20.0.w, 0.0.h, 20.0.w, 34.0.h),
                child: const SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AddOtherCardButton(),
                      ///Card Checkout Button
                      CheckoutButton(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


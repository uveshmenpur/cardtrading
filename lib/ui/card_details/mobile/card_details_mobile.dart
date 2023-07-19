import 'package:cardtrading/framework/controllers/card_details/card_details_controller.dart';
import 'package:cardtrading/framework/controllers/checkout/checkout_controller.dart';
import 'package:cardtrading/ui/card_details/mobile/helper/add_to_card_button.dart';
import 'package:cardtrading/ui/card_details/mobile/helper/card_description.dart';
import 'package:cardtrading/ui/card_details/mobile/helper/card_details_bottom_content.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardDetailsMobile extends StatelessWidget {
  CardDetailsMobile({super.key, required this.url});

  final String url;
  final cartModel = CartModel(cardName: AppStrings.keyCardDescription, cardType: AppStrings.keyCardExclusive, cardQty: 1, cardPrice: AppStrings.keyCardPrice);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        titleWidget: Text(
          AppStrings.keyCardDetail,
          style: TextStyles.medium.copyWith(fontSize: 16.sp),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        isTitleCentered: true,
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _divider(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              height: 340.h,
              child: Image.asset(
                url,
                width: 200.w,
                height: 300.h,
                fit: BoxFit.fill,
              ),
            ),
            _divider(),
            CardDescription(cartModel: cartModel),
            _divider(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                AppStrings.keyCardScreenContent,
                style: TextStyles.regular
                    .copyWith(fontSize: 12.sp, color: AppColors.greyText),
              ),
            ),
            _divider(),
            Container(
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.topLeft,
              child: Consumer(builder:
                  (BuildContext context, WidgetRef ref, Widget? child) {
                final cardDetailsWatch = ref.watch(cardDetailsController);
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      cardDetailsWatch.keys.length,
                      (index) {
                        return RichText(
                          text: TextSpan(
                            text: cardDetailsWatch.keys[index],
                            style: TextStyles.regular.copyWith(
                                color: AppColors.lightGolden, fontSize: 12.sp),
                            children: [
                              TextSpan(
                                text: cardDetailsWatch.values[index],
                                style: TextStyles.light.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.lightGolden,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        );
                      },
                    ),
                  ],
                );
              }),
            ),
            _divider(),
            const CardDetailsBottomContent(),
          ],
        ),
      ),
      bottomNavigationBar: AddToCartButton(cartModel: cartModel,),
    );
  }

  Divider _divider() {
    return const Divider(
      thickness: 1.0,
      color: AppColors.dividerColor,
    );
  }
}
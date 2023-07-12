import 'package:cardtrading/framework/controllers/card_details/card_details_controller.dart';
import 'package:cardtrading/framework/controllers/checkout/checkout_controller.dart';
import 'package:cardtrading/ui/card_details/mobile/helper/card_details_icons.dart';
import 'package:cardtrading/ui/checkout/checkout.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardDetailsMobile extends ConsumerStatefulWidget {
  CardDetailsMobile({super.key, required this.url});

  final String url;
  final cartModel = CartModel(cardName: AppStrings.keyCardDescription, cardType: AppStrings.keyCardExclusive, cardQty: 1, cardPrice: AppStrings.keyCardPrice);

  @override
  ConsumerState<CardDetailsMobile> createState() => _CardDetailsMobileState();
}

class _CardDetailsMobileState extends ConsumerState<CardDetailsMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.keyCardDetail,
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
                widget.url,
                width: 200.w,
                height: 300.h,
                fit: BoxFit.fill,
              ),
            ),
            _divider(),
            ListTile(
              title: Text(
                widget.cartModel.cardName,
                maxLines: 2,
                softWrap: true,
                style: TextStyles.medium.copyWith(color: AppColors.white),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Consumer(builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final cardDetailsWatch = ref.watch(cardDetailsController);
                    return IconButton(
                      iconSize: 24,
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                      onPressed: () {
                        cardDetailsWatch.setFavourite();
                      },
                      icon: Icon(
                        cardDetailsWatch.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: AppColors.primary,
                      ),
                    );
                  }),
                  Text(
                    AppStrings.keyCardLikesCount,
                    style: TextStyles.regular,
                  ),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 70.w,
                      height: 20.h,
                      color: AppColors.golden,
                      child: Center(
                        child: Text(
                          widget.cartModel.cardType,
                          style: TextStyles.semiBold
                              .copyWith(color: Colors.black, fontSize: 12.sp),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Text(''),
                    ),
                  ],
                ),
              ),
            ),
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
            Container(
              width: double.infinity,
              height: 0.25.sh,
              decoration: const BoxDecoration(
                color: AppColors.containerBg,
              ),
              margin: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppStrings.keyCollectiveProducts,
                    style: TextStyles.semiBold.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.white,
                    ),
                  ),
                  Consumer(builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final cardDetailsWatch = ref.watch(cardDetailsController);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...List.generate(
                            cardDetailsWatch.cardDetailDescription.length,
                            (index) {
                          return CardDetailsIcon(
                            svg: SvgPicture.asset(
                              cardDetailsWatch.cardDetailIcons[index],
                              width: 40.w,
                              height: 40.h,
                            ),
                            title:
                                cardDetailsWatch.cardDetailDescription[index],
                          );
                        })
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: CommonButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Checkout(cartModel: widget.cartModel,);
                },
              ),
            );
          },
          buttonText: '',
          buttonPadding: const EdgeInsets.all(12.0),
          prefixWidget: Text(
            AppStrings.keyCardPrice2,
            style: TextStyles.semiBold
                .copyWith(fontSize: 16.sp, color: AppColors.dividerColor),
          ),
          suffixWidget: Text(
            AppStrings.keyAddToCart,
            style: TextStyles.semiBold
                .copyWith(fontSize: 16.sp, color: AppColors.dividerColor),
          ),
        ),
      ),
    );
  }

  Divider _divider() {
    return const Divider(
      thickness: 1.0,
      color: AppColors.dividerColor,
    );
  }
}

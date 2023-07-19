import 'package:cardtrading/framework/controllers/card_details/card_details_controller.dart';
import 'package:cardtrading/framework/controllers/checkout/checkout_controller.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardDescription extends StatelessWidget {
  const CardDescription({
    super.key,
    required this.cartModel,
  });

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        cartModel.cardName,
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
                  cartModel.cardType,
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
    );
  }
}

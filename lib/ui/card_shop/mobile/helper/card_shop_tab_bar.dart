import 'package:cardtrading/framework/controllers/card_shop/card_shop_controller.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardShopTabBar extends StatelessWidget {
  const CardShopTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.indicatorColor,
          width: 1.5,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final cardShopWatcher = ref.watch(cardShopController);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                    decoration: cardShopWatcher.pageIndex == 0
                        ? const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: AppColors.primary,
                          width: 2.0,
                        ),
                      ),
                    )
                        : null,
                    child: Text(
                      AppStrings.keyCardExclusive,
                      style: TextStyles.regular.copyWith(
                        fontFamily: TextStyles.secondaryFontFamily,
                        color: cardShopWatcher.pageIndex == 0
                            ? AppColors.primary
                            : AppColors.indicatorColor,
                      ),
                    ),
                  ),
                  onTap: () {
                    cardShopWatcher.setOrIncrementPageIndex(index: 0);
                  },
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                    decoration: cardShopWatcher.pageIndex == 1
                        ? const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: AppColors.primary,
                          width: 2.0,
                        ),
                      ),
                    )
                        : null,
                    child: Text(
                      AppStrings.keyOpenStore,
                      style: TextStyles.regular.copyWith(
                        fontFamily: TextStyles.secondaryFontFamily,
                        color: cardShopWatcher.pageIndex == 1
                            ? AppColors.primary
                            : AppColors.indicatorColor,
                      ),
                    ),
                  ),
                  onTap: () {
                    cardShopWatcher.setOrIncrementPageIndex(index: 1);
                  },
                ),
              ],
            );
          }),
    );
  }
}
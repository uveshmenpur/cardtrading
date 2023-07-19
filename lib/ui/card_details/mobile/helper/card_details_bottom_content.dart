import 'package:cardtrading/framework/controllers/card_details/card_details_controller.dart';
import 'package:cardtrading/ui/card_details/mobile/helper/card_details_icons.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardDetailsBottomContent extends StatelessWidget {
  const CardDetailsBottomContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}


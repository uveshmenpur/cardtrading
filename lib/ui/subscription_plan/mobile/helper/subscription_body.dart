import 'package:cardtrading/ui/subscription_plan/mobile/helper/basic_subscription_card.dart';
import 'package:cardtrading/ui/subscription_plan/mobile/helper/elite_subscription_card.dart';
import 'package:cardtrading/ui/subscription_plan/mobile/helper/premium_subscription_card.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionBody extends StatelessWidget {
  const SubscriptionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///
          CommonTitle(
            text: AppStrings.keyChooseYourPlan,
            tStyle: TextStyles.regular
                .copyWith(fontFamily: 'Sora', color: AppColors.golden),
            align: TextAlign.start,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            AppStrings.keyTermsAndConditionDescription,
            style: TextStyles.regular.copyWith(
              color: AppColors.greyText,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          const EliteSubscriptionCard(),
          SizedBox(
            height: 20.h,
          ),
          const BasicSubscriptionCard(),
          SizedBox(
            height: 20.h,
          ),
          const PremiumSubscriptionCard(),
        ],
      ),
    );
  }
}

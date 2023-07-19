import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_drawer.dart';
import 'package:cardtrading/ui/subscription_plan/mobile/helper/subscription_body.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubscriptionMobile extends StatelessWidget {
  const SubscriptionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: SvgPicture.asset('${AppAssets.svgLocation}menu.svg'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomeScreenDrawer();
                },
              ),
            );
          },
        ),
        titleWidget: Text(
          AppStrings.keySubscriptionPlan,
          style: TextStyles.regular.copyWith(
            fontSize: 16.sp,
            fontFamily: 'Sora',
            color: AppColors.white,
          ),
        ),
        isTitleCentered: true,
      ),
      drawer: const HomeScreenDrawer(),
      body: const SubscriptionBody(),
    );
  }
}

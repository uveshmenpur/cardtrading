import 'package:cardtrading/framework/controllers/complete_your_profile/complete_profile_controller.dart';
import 'package:cardtrading/ui/complete_your_profile/mobile/helper/add_address_screen.dart';
import 'package:cardtrading/ui/complete_your_profile/mobile/helper/complete_profile_screen.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompleteProfileMobile extends StatelessWidget {
  const CompleteProfileMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        backgroundColor: AppColors.background,
        isTitleCentered: true,
        titleWidget: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? widget) {
          final completeProfileWatch = ref.watch(completeProfileController);
          return Text(
            completeProfileWatch.page == 0
                ? AppStrings.keyCompleteYourProfile
                : AppStrings.keyAddAddress,
            style: TextStyles.medium.copyWith(
              fontSize: 16.sp,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }),
        leading: Padding(
          padding: EdgeInsets.all(12.0.w),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              '${AppAssets.svgLocation}arrow_right_line.svg',
              width: 16.w,
              height: 16.h,
            ),
          ),
        ),
      ),
      body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? widget) {
        final completeProfileWatch = ref.watch(completeProfileController);
        return PageView(
          controller: completeProfileWatch.pageController,
          physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          onPageChanged: (index) {
            completeProfileWatch.changePage(index);
          },
          children: const [
            CompleteYourProfile(),
            AddAddressScreen(),
          ],
        );
      }),
    );
  }
}

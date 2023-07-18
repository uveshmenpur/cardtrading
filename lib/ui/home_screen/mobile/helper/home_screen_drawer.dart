import 'package:cardtrading/framework/controllers/home_screen/home_screen_controller.dart';
import 'package:cardtrading/ui/home_screen/home_screen.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_drawer_body.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/widget/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        isLeadingEnable: false,
        backgroundColor: AppColors.background,
        leading: InkWell(
          child: Padding(
            padding: EdgeInsets.all(10.0.w),
            child: SvgPicture.asset('${AppAssets.svgLocation}close_line.svg'),
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
        title: AppStrings.keyWalterWhite,
        isTitleCentered: true,
        actions: [
          Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final homeScreenWatch = ref.watch(homeScreenController);
            return InkWell(
              onTap: () {
                homeScreenWatch.changeMode();
              },
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: SvgPicture.asset(homeScreenWatch.url),
              ),
            );
          }),
        ],
      ),
      backgroundColor: AppColors.background,
      body: const HomeScreenDrawerBody(),
    );
  }
}

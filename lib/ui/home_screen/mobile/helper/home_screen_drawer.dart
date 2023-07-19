import 'package:cardtrading/framework/controllers/home_screen/home_screen_controller.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_drawer_body.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenDrawer extends ConsumerStatefulWidget {
  const HomeScreenDrawer({super.key});

  @override
  ConsumerState<HomeScreenDrawer> createState() => _HomeScreenDrawerState();
}

class _HomeScreenDrawerState extends ConsumerState<HomeScreenDrawer> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: InkWell(
          child: Padding(
            padding: EdgeInsets.all(10.0.r),
            child: SvgPicture.asset('${AppAssets.svgLocation}close_line.svg'),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(AppStrings.keyWalterWhite),
        centerTitle: true,
        actions: [
          Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final homeScreenWatch = ref.watch(homeScreenController);
              return InkWell(
                onTap: () {
                  homeScreenWatch.changeMode();
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: SvgPicture.asset(homeScreenWatch.url),
                ),
              );
            }
          ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: const HomeScreenDrawerBody(),
    );
  }
}

import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_drawe_body.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenDrawer extends StatefulWidget {
  const HomeScreenDrawer({super.key});

  @override
  State<HomeScreenDrawer> createState() => _HomeScreenDrawerState();
}

class _HomeScreenDrawerState extends State<HomeScreenDrawer> {
  String url = '${AppAssets.svgLocation}dark_mode.svg';

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
          InkWell(
            onTap: () {
              setState(
                () {
                  url == '${AppAssets.svgLocation}dark_mode.svg'
                      ? url = '${AppAssets.svgLocation}light_mode.svg'
                      : url = '${AppAssets.svgLocation}dark_mode.svg';
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: SvgPicture.asset(url),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: HomeScreenDrawerBody(),
    );
  }
}

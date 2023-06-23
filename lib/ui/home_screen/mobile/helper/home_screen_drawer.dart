import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_drawe_body.dart';
import 'package:cardtrading/ui/utils/colors.dart';
import 'package:cardtrading/ui/utils/my_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.background,
        elevation: 0,
        leading: InkWell(
          child: Padding(
            padding: EdgeInsets.all(10.0.r),
            child: SvgPicture.asset('${MyStrings.svgLocation}close_line.svg'),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(MyStrings.heisenberg),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: SvgPicture.asset('${MyStrings.svgLocation}dark_mode.svg'),
          ),
        ],
      ),
      backgroundColor: MyColors.background,
      body: HomeScreenDrawerBody(),
    );
  }
}

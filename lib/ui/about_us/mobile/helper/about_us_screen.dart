import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_drawer.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        ///Opens Drawer
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
        title: Text(
          title,
          style: TextStyles.bold.copyWith(
            fontSize: 16.sp,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          ///Common Paragraph
          CommonParagraph(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Divider(
              thickness: 1.0,
              color: AppColors.indicatorColor,
            ),
          ),
          ///Common Paragraph
          CommonParagraph(),
        ],
      ),
    );
  }
}

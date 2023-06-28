import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardDetailsIcon extends StatelessWidget {
  const CardDetailsIcon({super.key, required this.url, required this.title});

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SvgPicture.asset(url,width: 40.w,height: 40.h,),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyles.medium.copyWith(
              color: AppColors.containerText,
              fontSize: 11.sp,
            ),
            softWrap: true,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

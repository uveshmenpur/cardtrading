import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardDetailsIcon extends StatelessWidget {
  const CardDetailsIcon({super.key, required this.title, required this.svg});

  final Widget svg;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          svg,
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyles.medium.copyWith(
                color: AppColors.containerText,
                fontSize: 11.sp,
              ),
              softWrap: true,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}

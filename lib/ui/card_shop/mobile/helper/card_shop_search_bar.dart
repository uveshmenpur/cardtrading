import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardShopSearchBar extends StatelessWidget {
  const CardShopSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      margin: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: AppStrings.keySearchHere,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.dividerColor,
                    style: BorderStyle.solid,
                  ),
                ),
                prefixIcon: SvgPicture.asset(
                  '${AppAssets.svgLocation}search_dark.svg',
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ),
          ),
          SvgPicture.asset(
            '${AppAssets.svgLocation}sort.svg',
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(
            width: 11.w,
          ),
          SvgPicture.asset(
            '${AppAssets.svgLocation}filter.svg',
            width: 24.w,
            height: 24.h,
          ),
        ],
      ),
    );
  }
}
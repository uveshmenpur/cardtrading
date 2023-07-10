import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutList extends StatefulWidget {
  const CheckoutList({super.key, required this.url});

  final String url;

  @override
  State<CheckoutList> createState() => _CheckoutListState();
}

class _CheckoutListState extends State<CheckoutList> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(39.5, 20.0, 20.0, 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 95.w,
            height: 128.h,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 43.0, 43.0),
              child: Image.asset(
                widget.url,
                alignment: Alignment.topLeft,
                fit: BoxFit.contain,
                width: 50.w,
                height: 85.h,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 179.w,
                child: Text(
                  AppStrings.keyCardDescription,
                  softWrap: true,
                  maxLines: 2,
                  style: TextStyles.regular.copyWith(
                    fontSize: 12.sp,
                    fontFamily: 'Sora',
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                AppStrings.keyCardExclusive,
                style: TextStyles.regular.copyWith(
                    fontFamily: 'Sora',
                    fontSize: 12.sp,
                    color: AppColors.golden),
              ),
              SizedBox(
                height: 13.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          itemCount >= 1 ? itemCount-- : itemCount = 0;
                        },
                      );
                    },
                    child: Container(
                      width: 24.w,
                      height: 24.w,
                      padding: const EdgeInsets.only(right: 16.0),
                      child: const Icon(
                        Icons.remove,
                        color: AppColors.greyText,
                        size: 12,
                      ),
                    ),
                  ),
                  Text(
                    itemCount.toString(),
                    style: TextStyles.regular.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.white,
                        fontFamily: 'Sora'),
                  ),
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          itemCount++;
                        },
                      );
                    },
                    child: Container(
                      width: 24.w,
                      height: 24.h,
                      padding: const EdgeInsets.only(left: 8.0),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.primary,
                        size: 12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                AppStrings.keyCardPrice,
                style: TextStyles.bold.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              setState(
                () {
                  itemCount = 0;
                },
              );
            },
            child: SvgPicture.asset(
              '${AppAssets.svgLocation}delete_bin.svg',
              width: 20.w,
              height: 20.h,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopCard extends StatefulWidget {
  const ShopCard({super.key, required this.index});

  final int index;

  @override
  State<ShopCard> createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.cardBackgroundColor,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                color: AppColors.golden,
                child: Text(
                  AppStrings.keyCardExclusive,
                  style: TextStyles.semiBold
                      .copyWith(color: Colors.black, fontSize: 12.sp),
                ),
              ),
              IconButton(
                iconSize: 24,
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                onPressed: () {
                  setState(() {
                    isFavourite ? isFavourite = false : isFavourite = true;
                  });
                },
                icon: Icon(
                  isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.primary,
                ),
              ),
              Text(
                AppStrings.keyCardLikesCount,
                style: TextStyles.regular,
              ),
            ],
          ),
          Image.asset(
            '${AppAssets.imgLocation}card_${widget.index % 2}.png',
            width: 100.w,
            height: 150.h,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppStrings.keyCardDescription,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
              style: TextStyles.regular.copyWith(fontSize: 12.sp),
            ),
          ),
          Text(
            AppStrings.keyCardPrice,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}

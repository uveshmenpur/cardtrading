import 'package:cardtrading/ui/card_details/card_details.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopCard extends StatefulWidget {
  const ShopCard({super.key, required this.index, this.onTap});

  final int index;
  final void Function()? onTap;

  @override
  State<ShopCard> createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap ??
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CardDetails(
                      url:
                          '${AppAssets.imgLocation}card_${widget.index % 4}.png');
                },
              ),
            );
          },
      child: Card(
        elevation: 0,
        color: AppColors.cardBackgroundColor,
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
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
            SizedBox(
              height: 8.h,
            ),
            Expanded(
              child: Image.asset(
                '${AppAssets.imgLocation}card_${widget.index % 4}.png',
                width: 100.w,
                height: 150.h,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 8.h,
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
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
    );
  }
}

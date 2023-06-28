import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopCard extends StatefulWidget {
  const ShopCard({super.key});

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
                padding: const EdgeInsets.all(4.0),
                color: AppColors.golden,
                child: Text(
                  'Exclusive',
                  style: TextStyles.regular.copyWith(
                    color: Colors.black,
                  ),
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
                  isFavourite ? Icons.favorite_border : Icons.favorite,
                  color: AppColors.primary,
                ),
              ),
              Text(
                '20K',
                style: TextStyles.regular,
              ),
            ],
          ),
          Image.asset(
            '${AppAssets.imgLocation}card.png',
            width: 100.w,
            height: 150.h,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '2004 PANINI MEGA CRACKS LIONEL MESSI #71BIS',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
              style: TextStyles.regular.copyWith(
                fontSize: 12.sp
              ),
            ),
          ),
          Text('21497.00 KD',textAlign: TextAlign.center,style: TextStyles.semiBold.copyWith(
            color: AppColors.primary
          ),),
        ],
      ),
    );
  }
}

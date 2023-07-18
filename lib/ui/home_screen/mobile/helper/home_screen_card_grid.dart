import 'package:cardtrading/ui/utils/widget/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenCardsGrid extends StatelessWidget {
  const HomeScreenCardsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw,
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 2,
          crossAxisSpacing: 1,
          crossAxisCount: 2,
          childAspectRatio: 0.5,
        ),
        itemBuilder: (context, index) {
          return ShopCard(
            index: index,
          );
        },
      ),
    );
  }
}

import 'package:cardtrading/ui/featured_seller/mobile/helper/featured_seller_body.dart';
import 'package:cardtrading/ui/home_screen/home_screen.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedSellerMobile extends StatelessWidget {
  const FeaturedSellerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        titleWidget: Text(
          AppStrings.keyFeaturedSellers,
          style: TextStyles.bold.copyWith(fontSize: 16.sp),
        ),
        isTitleCentered: true,
      ),
      body: const FeaturedSellerBody(),
    );
  }
}

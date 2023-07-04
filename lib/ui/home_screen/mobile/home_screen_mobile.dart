import 'package:cardtrading/ui/authentication/get_otp.dart';
import 'package:cardtrading/ui/card_details/card_details.dart';
import 'package:cardtrading/ui/card_shop/card_shop.dart';
import 'package:cardtrading/ui/featured_seller/featured_seller.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_description.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_divider.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_drawer.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_featured_collection_list.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_profiles.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'helper/home_screen_banner.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  int id = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      key: _globalKey,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: SvgPicture.asset('${AppAssets.svgLocation}menu.svg'),
          onPressed: () {
            _globalKey.currentState!.openDrawer();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: SvgPicture.asset('${AppAssets.svgLocation}search.svg'),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child:
                SvgPicture.asset('${AppAssets.svgLocation}shopping_cart.svg'),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: SvgPicture.asset('${AppAssets.svgLocation}notification.svg'),
          ),
        ],
      ),
      drawer: const HomeScreenDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeScreenBanner(),
            const HomeScreenDivider(),
            const HomeScreenFeaturedCollectionList(),
            const HomeScreenDivider(),
            HomeScreenDescription(
              title: AppStrings.keyFeaturedSellers,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const FeaturedSeller();
                    },
                  ),
                );
              },
            ),
            const HomeScreenProfiles(),
            HomeScreenDescription(
              title: AppStrings.keyShop,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CardShop();
                    },
                  ),
                );
              },
            ),
            Container(
              width: 0.9.sw,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CardDetails();
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                      top: BorderSide(
                        color: id == 0 ? AppColors.primary : Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: SvgPicture.asset('${AppAssets.svgLocation}home.svg'),
                ),
                label: AppStrings.keyHome,
                backgroundColor: AppColors.background),
            BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                      top: BorderSide(
                        color: id == 1 ? AppColors.primary : Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child:
                      SvgPicture.asset('${AppAssets.svgLocation}portfolio.svg'),
                ),
                label: AppStrings.keyPortfolio,
                backgroundColor: AppColors.background),
            BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                      top: BorderSide(
                        color: id == 2 ? AppColors.primary : Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: SvgPicture.asset('${AppAssets.svgLocation}store.svg'),
                ),
                label: AppStrings.keyStore,
                backgroundColor: AppColors.background),
            BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                      top: BorderSide(
                        color: id == 3 ? AppColors.primary : Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child:
                      SvgPicture.asset('${AppAssets.svgLocation}profile.svg'),
                ),
                label: AppStrings.keyProfile,
                backgroundColor: AppColors.background),
          ],
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,
          backgroundColor: AppColors.background,
          currentIndex: id,
          type: BottomNavigationBarType.shifting,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyles.regular
              .copyWith(color: AppColors.primary, fontSize: 12.sp),
          selectedItemColor: AppColors.primary,
          unselectedLabelStyle: TextStyles.regular
              .copyWith(color: AppColors.white, fontSize: 12.sp),
          onTap: (index) {
            setState(
              () {
                id = index;
                if (id == 1 || id == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const GetOtp();
                      },
                    ),
                  );
                }
                id == 2
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CardShop();
                          },
                        ),
                      )
                    : null;
              },
            );
          },
        ),
      ),
    );
  }
}

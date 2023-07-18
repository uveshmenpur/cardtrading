import 'package:cardtrading/ui/card_shop/card_shop.dart';
import 'package:cardtrading/ui/featured_seller/featured_seller.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_app_bar_actions.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_bottom_navigation_bar.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_card_grid.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_description.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_divider.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_drawer.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_featured_collection_list.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_profiles.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/widget/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'helper/home_screen_banner.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      ///Common App Bar
      appBar: CommonAppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: SvgPicture.asset('${AppAssets.svgLocation}menu.svg'),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomeScreenDrawer();
                },
              ),
            );
          },
        ),
        actions:  const [
          HomeScreenAppBarActions(),
        ],
      ),
      drawer: const HomeScreenDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Home Screen Banner Carousel
            const HomeScreenBanner(),
            const HomeScreenDivider(),

            ///Featured Card Collection List
            const HomeScreenFeaturedCollectionList(),
            const HomeScreenDivider(),

            ///Featured Seller
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

            ///Card Shop
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
            const HomeScreenCardsGrid(),
          ],
        ),
      ),
      bottomNavigationBar: const HomeScreenBottomNavigationBar(),
    );
  }
}

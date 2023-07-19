import 'package:cardtrading/framework/controllers/card_shop/card_shop_controller.dart';
import 'package:cardtrading/ui/card_shop/mobile/helper/card_shop_grid.dart';
import 'package:cardtrading/ui/card_shop/mobile/helper/card_shop_search_bar.dart';
import 'package:cardtrading/ui/card_shop/mobile/helper/card_shop_tab_bar.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_bottom_navigation_bar.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_drawer.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/widget/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardShopMobile extends StatelessWidget {
  const CardShopMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: SvgPicture.asset('${AppAssets.svgLocation}menu.svg'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const HomeScreenDrawer();
            },),);
          },
        ),
        titleWidget: const Text(AppStrings.keyShop),
        isTitleCentered: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset('${AppAssets.svgLocation}notification.svg'),
          ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Consumer(
          builder: (BuildContext context,WidgetRef ref, Widget? widget) {
            return Column(
              children: [
                const CardShopTabBar(),
                ref.watch(cardShopController).pageIndex == 0
                    ? const CardShopSearchBar()
                    : Container(),
                ref.watch(cardShopController).pageIndex == 0
                    ? const CardShopGrid()
                    : Container(),
              ],
            );
          }
        ),
      ),
      bottomNavigationBar: const HomeScreenBottomNavigationBar(),
    );
  }
}

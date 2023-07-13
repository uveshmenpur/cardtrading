import 'package:cardtrading/framework/controllers/home_screen/home_screen_controller.dart';
import 'package:cardtrading/ui/authentication/get_otp.dart';
import 'package:cardtrading/ui/card_shop/card_shop.dart';
import 'package:cardtrading/ui/checkout/checkout.dart';
import 'package:cardtrading/ui/featured_seller/featured_seller.dart';
import 'package:cardtrading/ui/home_screen/home_screen.dart';
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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'helper/home_screen_banner.dart';

class HomeScreenMobile extends ConsumerStatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  ConsumerState<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends ConsumerState<HomeScreenMobile> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

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
          ...List.generate(
            3,
            (index) {
              final homeScreenWatch = ref.watch(homeScreenController);
              return InkWell(
                onTap: (){
                  if(index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Checkout();
                        },
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child:
                      SvgPicture.asset(homeScreenWatch.appBarActionList[index]),
                ),
              );
            },
          ),
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final homeScreenWatch = ref.watch(homeScreenController);
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: BottomNavigationBar(
              items: [
                ...List.generate(
                  4,
                  (index) {
                    return BottomNavigationBarItem(
                        icon: Container(
                          padding: const EdgeInsets.only(top: 8.0),
                          decoration: BoxDecoration(
                            border: BorderDirectional(
                              top: BorderSide(
                                color: homeScreenWatch.id == index
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 2.0,
                              ),
                            ),
                          ),
                          child: SvgPicture.asset(homeScreenWatch
                              .bottomNavigationBarSvgPath[index]),
                        ),
                        label: AppStrings.keyHome,
                        backgroundColor: AppColors.background);
                  },
                ),
              ],
              selectedFontSize: 10.sp,
              unselectedFontSize: 10.sp,
              backgroundColor: AppColors.background,
              currentIndex: homeScreenWatch.id,
              type: BottomNavigationBarType.shifting,
              showUnselectedLabels: true,
              selectedLabelStyle: TextStyles.regular
                  .copyWith(color: AppColors.primary, fontSize: 12.sp),
              selectedItemColor: AppColors.primary,
              unselectedLabelStyle: TextStyles.regular
                  .copyWith(color: AppColors.white, fontSize: 12.sp),
              onTap: (index) {
                homeScreenWatch.setId(newId: index);
                if (homeScreenWatch.id == 1 || homeScreenWatch.id == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const GetOtp();
                      },
                    ),
                  );
                }
                homeScreenWatch.id == 2
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CardShop();
                          },
                        ),
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomeScreen();
                          },
                        ),
                      );
              },
            ),
          );
        },
      ),
    );
  }
}

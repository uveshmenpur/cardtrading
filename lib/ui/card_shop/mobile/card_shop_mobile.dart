import 'package:cardtrading/framework/controllers/card_shop/card_shop_controller.dart';
import 'package:cardtrading/framework/controllers/home_screen/home_screen_controller.dart';
import 'package:cardtrading/ui/authentication/get_otp.dart';
import 'package:cardtrading/ui/card_shop/card_shop.dart';
import 'package:cardtrading/ui/home_screen/home_screen.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_drawer.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardShopMobile extends ConsumerStatefulWidget {
  const CardShopMobile({super.key});

  @override
  ConsumerState<CardShopMobile> createState() => _CardShopMobileState();
}

class _CardShopMobileState extends ConsumerState<CardShopMobile> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('${AppAssets.svgLocation}menu.svg'),
          onPressed: () {
            _globalKey.currentState!.openDrawer();
          },
        ),
        title: const Text(AppStrings.keyShop),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset('${AppAssets.svgLocation}notification.svg'),
          ),
        ],
      ),
      drawer: const HomeScreenDrawer(),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _tabBar(),
            ref.watch(cardShopController).pageIndex == 0
                ? Container(
                    height: 30.h,
                    margin: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: AppStrings.keySearchHere,
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.dividerColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              prefixIcon: SvgPicture.asset(
                                '${AppAssets.svgLocation}search_dark.svg',
                                width: 24.w,
                                height: 24.h,
                              ),
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          '${AppAssets.svgLocation}sort.svg',
                          width: 24.w,
                          height: 24.h,
                        ),
                        SizedBox(
                          width: 11.w,
                        ),
                        SvgPicture.asset(
                          '${AppAssets.svgLocation}filter.svg',
                          width: 24.w,
                          height: 24.h,
                        ),
                      ],
                    ),
                  )
                : Container(),
            ref.watch(cardShopController).pageIndex == 0
                ? Container(
                    width: 0.9.sw,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 1,
                              crossAxisCount: 2,
                              childAspectRatio: 0.5),
                      itemBuilder: (context, index) {
                        return ShopCard(
                          index: index,
                        );
                      },
                    ),
                  )
                : Container(),
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

  Widget _tabBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.indicatorColor,
          width: 1.5,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final cardShopWatcher = ref.watch(cardShopController);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                decoration: cardShopWatcher.pageIndex == 0
                    ? const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: AppColors.primary,
                            width: 2.0,
                          ),
                        ),
                      )
                    : null,
                child: Text(
                  AppStrings.keyCardExclusive,
                  style: TextStyles.regular.copyWith(
                    fontFamily: TextStyles.secondaryFontFamily,
                    color: cardShopWatcher.pageIndex == 0
                        ? AppColors.primary
                        : AppColors.indicatorColor,
                  ),
                ),
              ),
              onTap: () {
                cardShopWatcher.setOrIncrementPageIndex(index: 0);
              },
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                decoration: cardShopWatcher.pageIndex == 1
                    ? const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: AppColors.primary,
                            width: 2.0,
                          ),
                        ),
                      )
                    : null,
                child: Text(
                  AppStrings.keyOpenStore,
                  style: TextStyles.regular.copyWith(
                    fontFamily: TextStyles.secondaryFontFamily,
                    color: cardShopWatcher.pageIndex == 1
                        ? AppColors.primary
                        : AppColors.indicatorColor,
                  ),
                ),
              ),
              onTap: () {
                cardShopWatcher.setOrIncrementPageIndex(index: 1);
              },
            ),
          ],
        );
      }),
    );
  }
}

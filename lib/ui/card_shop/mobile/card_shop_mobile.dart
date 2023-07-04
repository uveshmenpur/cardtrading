import 'package:cardtrading/ui/authentication/get_otp.dart';
import 'package:cardtrading/ui/card_details/card_details.dart';
import 'package:cardtrading/ui/card_shop/card_shop.dart';
import 'package:cardtrading/ui/home_screen/home_screen.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_drawer.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardShopMobile extends StatefulWidget {
  const CardShopMobile({super.key});

  @override
  State<CardShopMobile> createState() => _CardShopMobileState();
}

class _CardShopMobileState extends State<CardShopMobile> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  int pageIndex = 0;
  int id = 2;

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
            pageIndex == 0
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
            pageIndex == 0
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
                  )
                : Container(),
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
                  child: SvgPicture.asset(id != 0
                      ? '${AppAssets.svgLocation}home.svg'
                      : '${AppAssets.svgLocation}home_primary.svg'),
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
                  child: SvgPicture.asset(id == 1
                      ? '${AppAssets.svgLocation}portfolio_primary.svg'
                      : '${AppAssets.svgLocation}portfolio.svg'),
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
                  child: SvgPicture.asset(id == 2
                      ? '${AppAssets.svgLocation}store_primary.svg'
                      : '${AppAssets.svgLocation}store.svg'),
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
                  child: SvgPicture.asset(id == 3
                      ? '${AppAssets.svgLocation}profile_primary.svg'
                      : '${AppAssets.svgLocation}profile.svg'),
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
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomeScreen();
                          },
                        ),
                      );
              },
            );
          },
        ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 13.0),
              decoration: pageIndex == 0
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
                  color: pageIndex == 0
                      ? AppColors.primary
                      : AppColors.indicatorColor,
                ),
              ),
            ),
            onTap: () {
              setState(
                () {
                  pageIndex = 0;
                },
              );
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 13.0),
              decoration: pageIndex == 1
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
                  color: pageIndex == 1
                      ? AppColors.primary
                      : AppColors.indicatorColor,
                ),
              ),
            ),
            onTap: () {
              setState(
                () {
                  pageIndex = 1;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

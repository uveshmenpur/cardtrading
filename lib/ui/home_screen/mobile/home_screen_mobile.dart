import 'package:banner_carousel/banner_carousel.dart';
import 'package:cardtrading/ui/authentication/get_otp.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_drawer.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_featured_collection_list.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: BannerCarousel(
                viewportFraction: 1.0,
                showIndicator: false,
                initialPage: 1,
                customizedBanners: [
                  SizedBox(
                    width: 0.9.sw,
                    height: 0.3.sh,
                    child: Image.network(
                      'http://cloud1.kodyinfotech.com:7000/online-test-management/public/uploads/media/20f89daadc90b1c4df3418dc1fa53e99.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 0.9.sw,
                    height: 0.3.sh,
                    child: Image.network(
                      'http://cloud1.kodyinfotech.com:7000/online-test-management/public/uploads/media/20f89daadc90b1c4df3418dc1fa53e99.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 0.9.sw,
                    height: 0.3.sh,
                    child: Image.network(
                      'http://cloud1.kodyinfotech.com:7000/online-test-management/public/uploads/media/20f89daadc90b1c4df3418dc1fa53e99.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(
                thickness: 1.5,
              ),
            ),
            const HomeScreenFeaturedCollectionList(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(
                thickness: 1.5,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.keyFeaturedSellers,
                    style: TextStyles.regular
                        .copyWith(color: AppColors.golden, fontSize: 18.sp),
                  ),
                  Text(
                    AppStrings.keySeeAll,
                    style: TextStyles.regular.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              height: 120.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 56.w,
                          height: 56.h,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('${AppAssets.imgLocation}card.png'),
                          ),
                        ),
                        SizedBox(
                          width: 56.w,
                          child: Text(
                            'Shohei Ohtani',
                            maxLines: 2,
                            style: TextStyles.regular
                                .copyWith(color: AppColors.greyText),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.keyShop,
                    style: TextStyles.regular
                        .copyWith(color: AppColors.golden, fontSize: 18.sp),
                  ),
                  Text(
                    AppStrings.keySeeAll,
                    style: TextStyles.regular.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
            ),
            Container(
              width: 0.9.sw,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 1,
                    crossAxisCount: 2,
                    childAspectRatio: 0.5),
                itemBuilder: (context, index) {
                  return const ShopCard();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('${AppAssets.svgLocation}home.svg'),
                label:AppStrings.keyHome,
                backgroundColor: AppColors.background),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('${AppAssets.svgLocation}portfolio.svg'),
                label: AppStrings.keyPortfolio,
                backgroundColor: AppColors.background),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('${AppAssets.svgLocation}store.svg'),
                label: AppStrings.keyStore,
                backgroundColor: AppColors.background),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('${AppAssets.svgLocation}profile.svg'),
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
              },
            );
          },
        ),
      ),
    );
  }
}

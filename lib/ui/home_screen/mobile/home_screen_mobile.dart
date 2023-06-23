import 'package:banner_carousel/banner_carousel.dart';
import 'package:cardtrading/ui/home_screen/mobile/helper/home_screen_drawer.dart';
import 'package:cardtrading/ui/utils/colors.dart';
import 'package:cardtrading/ui/utils/my_strings.dart';
import 'package:cardtrading/ui/utils/text_style.dart';
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
      backgroundColor: MyColors.background,
      key: _globalKey,
      appBar: AppBar(
        backgroundColor: MyColors.background,
        leading: IconButton(
          icon: SvgPicture.asset('assets/svg/menu.svg'),
          onPressed: () {
            _globalKey.currentState!.openDrawer();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: SvgPicture.asset('${MyStrings.svgLocation}search.svg'),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child:
                SvgPicture.asset('${MyStrings.svgLocation}shopping_cart.svg'),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: SvgPicture.asset('${MyStrings.svgLocation}notification.svg'),
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
                animation: false,
                viewportFraction: 1.0,
                showIndicator: false,
                spaceBetween: 2.0,
                initialPage: 1,
                customizedBanners: [
                  SizedBox(
                      width: 0.9.sw,
                      height: 0.3.sh,
                      child: Image.network(
                        'http://cloud1.kodyinfotech.com:7000/online-test-management/public/uploads/media/20f89daadc90b1c4df3418dc1fa53e99.png',
                        fit: BoxFit.fill,
                      )),
                  SizedBox(
                      width: 0.9.sw,
                      height: 0.3.sh,
                      child: Image.network(
                        'http://cloud1.kodyinfotech.com:7000/online-test-management/public/uploads/media/20f89daadc90b1c4df3418dc1fa53e99.png',
                        fit: BoxFit.fill,
                      )),
                  SizedBox(
                      width: 0.9.sw,
                      height: 0.3.sh,
                      child: Image.network(
                        'http://cloud1.kodyinfotech.com:7000/online-test-management/public/uploads/media/20f89daadc90b1c4df3418dc1fa53e99.png',
                        fit: BoxFit.fill,
                      )),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                thickness: 1.5,
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
                icon: SvgPicture.asset('${MyStrings.svgLocation}home.svg'),
                label: 'Home',
                backgroundColor: MyColors.background),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('${MyStrings.svgLocation}portfolio.svg'),
                label: 'Portfolio',
                backgroundColor: MyColors.background),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('${MyStrings.svgLocation}store.svg'),
                label: 'Store',
                backgroundColor: MyColors.background),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('${MyStrings.svgLocation}profile.svg'),
                label: 'Profile',
                backgroundColor: MyColors.background),
          ],
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,
          backgroundColor: MyColors.background,
          currentIndex: id,
          type: BottomNavigationBarType.shifting,
          showUnselectedLabels: true,
          selectedLabelStyle:
              TextStyles.regular.copyWith(color: MyColors.primary,fontSize: 12.sp),
          selectedItemColor: MyColors.primary,
          unselectedLabelStyle:
              TextStyles.regular.copyWith(color: MyColors.white,fontSize: 12.sp),
          onTap: (index) {
            setState(() {
              id = index;
            });
          },
        ),
      ),
    );
  }
}
/*
Column(
                        children: [
                          ListTile(
                            title: RichText(
                              text: TextSpan(text: 'Buy',style: TextStyles.bold,children: [
                                TextSpan(text: 'with'),
                                TextSpan(text: 'Confidence')
                              ],),

                            ),
                          )
                        ],
                      ),

                      ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                CarouselSlider(
                  items: [
                    SizedBox(
                      width: 0.85.sw,
                      height: 0.3.sh,
                      child: Image.network('http://cloud1.kodyinfotech.com:7000/online-test-management/public/uploads/media/20f89daadc90b1c4df3418dc1fa53e99.png',fit: BoxFit.cover,)
                    ),
                    SizedBox(
                      width: 0.85.sw,
                      height: 0.3.sh,
                      child: Image.network('http://cloud1.kodyinfotech.com:7000/online-test-management/public/uploads/media/20f89daadc90b1c4df3418dc1fa53e99.png',fit: BoxFit.cover,)
                    ),
                    SizedBox(
                      width: 0.85.sw,
                      height: 0.3.sh,
                      child: Image.network('http://cloud1.kodyinfotech.com:7000/online-test-management/public/uploads/media/20f89daadc90b1c4df3418dc1fa53e99.png',fit: BoxFit.cover,)
                    ),
                  ],
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                  ),
                ),
              ],
            )
 */

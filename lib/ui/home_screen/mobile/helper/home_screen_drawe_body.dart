import 'package:cardtrading/ui/about_us/about_us.dart';
import 'package:cardtrading/ui/about_us/terms_and_condition.dart';
import 'package:cardtrading/ui/authentication/sign_in.dart';
import 'package:cardtrading/ui/choose_language/choose_language.dart';
import 'package:cardtrading/ui/home_screen/mobile/home_screen_mobile.dart';
import 'package:cardtrading/ui/terms_and_condition/subscription.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreenDrawerBody extends StatefulWidget {
  const HomeScreenDrawerBody({super.key});

  @override
  State<HomeScreenDrawerBody> createState() => _HomeScreenDrawerBodyState();
}

class _HomeScreenDrawerBodyState extends State<HomeScreenDrawerBody> {
  final List<String> list = [
    ///List of items in Home Screen drawer
    'Home',
    'My Orders',
    'Favourites',
    'Subscription Plan',
    'Rewards',
    'Terms & Conditions',
    'Change Language',
    'Refer & Earn',
    'Contact Us',
    'About us',
    'FAQ',
  ];
  int id = 0;

  @override
  Widget build(BuildContext context) {

    ///Drawer for Home Screen
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                list[index],
                style: TextStyles.medium.copyWith(
                    color:
                        index == id ? AppColors.primary : AppColors.greyText),
              ),
              onTap: () {
                if (index == 0) {
                  setState(
                    () {
                      id = 0;
                    },
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomeScreenMobile();
                      },
                    ),
                  );
                } else if (index == 3) {
                  setState(
                    () {
                      id = 3;
                    },
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Subscription();
                      },
                    ),
                  );
                } else if (index == 5) {
                  setState(
                    () {
                      id = 5;
                    },
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const TermsAndCondition();
                      },
                    ),
                  );
                } else if (index == 6) {
                  setState(
                    () {
                      id = 6;
                    },
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ChooseLanguage();
                      },
                    ),
                  );
                } else if (index == 9) {
                  setState(
                    () {
                      id = 9;
                    },
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AboutUs();
                      },
                    ),
                  );
                } else {
                  setState(
                    () {
                      id = 0;
                    },
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignIn();
                      },
                    ),
                  );
                }
              },
              trailing: index == 0
                  ? null
                  : SvgPicture.asset('${AppAssets.svgLocation}arrow_right.svg'),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 1.h,
            );
          },
          itemCount: 11),
    );
  }
}

import 'package:cardtrading/ui/authentication/sign_in.dart';
import 'package:cardtrading/ui/home_screen/mobile/home_screen_mobile.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreenDrawerBody extends StatelessWidget {
  HomeScreenDrawerBody({super.key});

  final List<String> list = [];

  @override
  Widget build(BuildContext context) {
    ///List of items in Home Screen drawer
    list.add('Home');
    list.add('My Orders');
    list.add('Favourites');
    list.add('Subscription Plan');
    list.add('Rewards');
    list.add('Terms & Conditions');
    list.add('Change Language');
    list.add('Refer & Earn');
    list.add('Contact Us');
    list.add('About us');
    list.add('FAQ');

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
                    color: index == 0 ? AppColors.primary : AppColors.greyText),
              ),
              onTap: index == 1
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomeScreenMobile();
                          },
                        ),
                      );
                    }
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignIn();
                          },
                        ),
                      );
                    },
              trailing: index == 0 ? null : SvgPicture.asset('${AppAssets.svgLocation}arrow_right.svg'),
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

import 'package:cardtrading/framework/controllers/home_screen/home_screen_controller.dart';
import 'package:cardtrading/ui/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenAppBarActions extends StatelessWidget {
  const HomeScreenAppBarActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? widget) {
        final homeScreenWatch = ref.watch(homeScreenController);
        return Row(
          children: [
            ...List.generate(
              3,
              (index) {
                return InkWell(
                  onTap: () {
                    if (index == 1) {
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
                    child: SvgPicture.asset(
                        homeScreenWatch.appBarActionList[index]),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

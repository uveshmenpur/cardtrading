import 'package:cardtrading/ui/home_screen/home_screen.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddOtherCardButton extends StatelessWidget {
  const AddOtherCardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54.w,
      height: 54.h,
      decoration: BoxDecoration(border: Border.all(color: AppColors.primary)),
      child: Center(
        child: InkWell(
          child: const Icon(
            Icons.add,
            color: AppColors.primary,
            size: 24,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

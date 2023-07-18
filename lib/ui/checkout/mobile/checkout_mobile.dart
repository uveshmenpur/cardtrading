import 'package:cardtrading/framework/controllers/checkout/checkout_controller.dart';
import 'package:cardtrading/ui/checkout/mobile/helper/checkout_body.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutMobile extends StatelessWidget {
  const CheckoutMobile({this.cartModel,super.key});
  final CartModel? cartModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        titleWidget: Text(
          AppStrings.keyCart,
          style: TextStyles.medium.copyWith(fontSize: 16.sp),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        isTitleCentered: true,
        backgroundColor: AppColors.background,
      ),
      body: CheckoutBody(cartModel: cartModel),
    );
  }
}

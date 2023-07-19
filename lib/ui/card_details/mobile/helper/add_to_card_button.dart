import 'package:cardtrading/framework/controllers/checkout/checkout_controller.dart';
import 'package:cardtrading/ui/checkout/checkout.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.cartModel,
  });

  final CartModel? cartModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: CommonButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Checkout(cartModel: cartModel,);
              },
            ),
          );
        },
        buttonText: '',
        buttonPadding: const EdgeInsets.all(12.0),
        prefixWidget: Text(
          AppStrings.keyCardPrice2,
          style: TextStyles.semiBold
              .copyWith(fontSize: 16.sp, color: AppColors.dividerColor),
        ),
        suffixWidget: Text(
          AppStrings.keyAddToCart,
          style: TextStyles.semiBold
              .copyWith(fontSize: 16.sp, color: AppColors.dividerColor),
        ),
      ),
    );
  }
}

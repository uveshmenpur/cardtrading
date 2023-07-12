import 'package:cardtrading/framework/controllers/checkout/checkout_controller.dart';
import 'package:cardtrading/ui/checkout/mobile/checkout_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key, this.cartModel});
  final CartModel? cartModel;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context,sizingInformation){
      if(sizingInformation.isMobile){
        return CheckoutMobile(cartModel:cartModel);
      }
      return CheckoutMobile(cartModel: cartModel,);
    });
  }
}

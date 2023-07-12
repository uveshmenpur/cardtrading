import 'package:cardtrading/framework/controllers/checkout/checkout_controller.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutList extends ConsumerStatefulWidget {
  const CheckoutList(this.cartModel, this.index, this.onRemoveTap, {super.key, required this.url});
  final String url;
  final CartModel cartModel;
  final int index;
  final void Function()? onRemoveTap;

  @override
  ConsumerState<CheckoutList> createState() => _CheckoutListState();
}

class _CheckoutListState extends ConsumerState<CheckoutList> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(39.5, 20.0, 20.0, 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 95.w,
            height: 128.h,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 43.0, 43.0),
              child: Image.asset(
                widget.url,
                alignment: Alignment.topLeft,
                fit: BoxFit.contain,
                width: 50.w,
                height: 85.h,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 179.w,
                child: Text(
                  widget.cartModel.cardName,
                  softWrap: true,
                  maxLines: 2,
                  style: TextStyles.regular.copyWith(
                    fontSize: 12.sp,
                    fontFamily: 'Sora',
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                widget.cartModel.cardType,
                style: TextStyles.regular.copyWith(
                    fontFamily: 'Sora',
                    fontSize: 12.sp,
                    color: AppColors.golden),
              ),
              SizedBox(
                height: 13.h,
              ),
              Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    final checkoutWatch = ref.watch(checkoutController);
                    return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          checkoutWatch.decreaseQty(widget.index);
                        },
                        child: Container(
                          width: 24.w,
                          height: 24.w,
                          padding: const EdgeInsets.only(right: 16.0),
                          child: const Icon(
                            Icons.remove,
                            color: AppColors.greyText,
                            size: 12,
                          ),
                        ),
                      ),
                      Text(
                        checkoutWatch.cartList[widget.index].cardQty.toString(),
                        style: TextStyles.regular.copyWith(
                            fontSize: 14.sp,
                            color: AppColors.white,
                            fontFamily: 'Sora'),
                      ),
                      InkWell(
                        onTap: () {
                          checkoutWatch.increaseQty(widget.index);
                        },
                        child: Container(
                          width: 24.w,
                          height: 24.h,
                          padding: const EdgeInsets.only(left: 8.0),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.primary,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                AppStrings.keyCardPrice,
                style: TextStyles.bold.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: widget.onRemoveTap,
            child: SvgPicture.asset(
              '${AppAssets.svgLocation}delete_bin.svg',
              width: 20.w,
              height: 20.h,
            ),
          ),
        ],
      ),
    );
  }
}

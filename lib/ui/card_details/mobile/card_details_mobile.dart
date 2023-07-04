import 'package:cardtrading/ui/card_details/mobile/helper/card_details_icons.dart';
import 'package:cardtrading/ui/checkout/checkout.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardDetailsMobile extends StatefulWidget {
  const CardDetailsMobile({super.key});

  @override
  State<CardDetailsMobile> createState() => _CardDetailsMobileState();
}

class _CardDetailsMobileState extends State<CardDetailsMobile> {
  bool isFavourite = false;
  final keys = [
    AppStrings.keyCardSubjectName,
    AppStrings.keyCardGrade,
    AppStrings.keyCardBrand
  ];
  final values = [
    AppStrings.keyCardSubjectNameValue,
    AppStrings.keyCardGradeValue,
    AppStrings.keyCardBrandValue
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.keyCardDetail,
          style: TextStyles.medium.copyWith(fontSize: 16.sp),
        ),
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              thickness: 1.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              height: 340.h,
              child: Image.asset(
                '${AppAssets.imgLocation}card_0.png',
                width: 200.w,
                height: 300.h,
                fit: BoxFit.fill,
              ),
            ),
            const Divider(
              thickness: 1.0,
            ),
            ListTile(
              title: Text(
                AppStrings.keyCardDescription,
                maxLines: 2,
                softWrap: true,
                style: TextStyles.medium.copyWith(color: AppColors.white),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    iconSize: 24,
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                    onPressed: () {
                      setState(
                        () {
                          isFavourite
                              ? isFavourite = false
                              : isFavourite = true;
                        },
                      );
                    },
                    icon: Icon(
                      isFavourite ? Icons.favorite : Icons.favorite_border,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    AppStrings.keyCardLikesCount,
                    style: TextStyles.regular,
                  ),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 70.w,
                      height: 20.h,
                      color: AppColors.golden,
                      child: Center(
                        child: Text(
                          AppStrings.keyCardExclusive,
                          style: TextStyles.semiBold.copyWith(
                              color: Colors.black, fontSize: 12.sp),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Text(''),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                AppStrings.keyCardScreenContent,
                style: TextStyles.regular
                    .copyWith(fontSize: 12.sp, color: AppColors.greyText),
              ),
            ),
            const Divider(
              thickness: 1.0,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                    keys.length,
                    (index) {
                      return RichText(
                        text: TextSpan(
                          text: keys[index],
                          style: TextStyles.regular.copyWith(
                              color: AppColors.lightGolden,
                              fontSize: 12.sp),
                          children: [
                            TextSpan(
                              text: values[index],
                              style: TextStyles.light.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.lightGolden,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      );
                    },
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1.0,
            ),
            Container(
              width: double.infinity,
              height: 0.25.sh,
              decoration: const BoxDecoration(
                color: AppColors.containerBg,
              ),
              margin: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppStrings.keyCollectiveProducts,
                    style: TextStyles.semiBold.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CardDetailsIcon(
                        svg: SvgPicture.asset(
                          '${AppAssets.svgLocation}shipping.svg',
                          width: 40.w,
                          height: 40.h,
                        ),
                        title: AppStrings.keyExpressShipping,
                      ),
                      CardDetailsIcon(
                        svg: SvgPicture.asset(
                          '${AppAssets.svgLocation}guarantee.svg',
                          width: 40.w,
                          height: 40.h,
                        ),
                        title: AppStrings.keyAuthenticGuarantee,
                      ),
                      CardDetailsIcon(
                        svg: SvgPicture.asset(
                          '${AppAssets.svgLocation}payment.svg',
                          width: 40.w,
                          height: 40.h,
                        ),
                        title: AppStrings.keySecurePayment,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 12.0),
        child: CommonButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const Checkout();
            },),);
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

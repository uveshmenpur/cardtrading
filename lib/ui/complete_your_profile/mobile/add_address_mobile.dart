import 'package:cardtrading/ui/home_screen/home_screen.dart';
import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:cardtrading/ui/utils/widget/common_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddAddressMobile extends StatefulWidget {
  const AddAddressMobile({super.key});

  @override
  State<AddAddressMobile> createState() => _AddAddressMobileState();
}

class _AddAddressMobileState extends State<AddAddressMobile> {
  final _formKey = GlobalKey<FormState>();
  String? area, block, street;
  int id = 0;
  List<String> areas = ['Isckon', 'Thaltej', 'NehruNagar', 'Bodakdev'];
  List<String> blocks = ['Isckon', 'Thaltej', 'NehruNagar', 'Bodakdev'];
  List<String> streets = ['Isckon', 'Thaltej', 'NehruNagar', 'Bodakdev'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppStrings.keyCompleteYourProfile,
          style: TextStyles.medium.copyWith(
            fontSize: 16.sp,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              '${AppAssets.svgLocation}arrow_right_line.svg',
              width: 16.w,
              height: 16.h,
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              width: 180,
                              child: Text(
                                AppStrings.keyEnterYourAddress,
                                softWrap: true,
                                maxLines: 3,
                                style: TextStyles.medium.copyWith(
                                  fontSize: 18.sp,
                                  color: AppColors.golden,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          ...List.generate(
                            2,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: 8.w,
                                  height: 8.h,
                                  decoration: const BoxDecoration(
                                      color: AppColors.primary),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        AppStrings.keyEnterYourAddressContent,
                        style: TextStyles.regular.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.checkoutTextColor,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          fillColor: AppColors.buttonBg,
                          filled: true,
                          contentPadding: EdgeInsets.all(16.0),
                        ),
                        onMenuStateChange: (isChanged) {
                          _formKey.currentState!.validate();
                        },
                        validator: (value) {
                          if (!areas.contains(value)) {
                            return 'This Field is mandatory';
                          }
                          return null;
                        },
                        items: areas
                            .map(
                              (String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyles.light.copyWith(
                                    color: AppColors.buttonText,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        value: area,
                        hint: Text(
                          'Area*',
                          style: TextStyles.light
                              .copyWith(color: AppColors.buttonText),
                        ),
                        onChanged: (value) {
                          setState(
                            () {
                              area = value;
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          fillColor: AppColors.buttonBg,
                          filled: true,
                          contentPadding: EdgeInsets.all(16.0),
                        ),
                        onMenuStateChange: (isChanged) {
                          _formKey.currentState!.validate();
                        },
                        validator: (value) {
                          if (!blocks.contains(value)) {
                            return 'This Field is mandatory';
                          }
                          return null;
                        },
                        items: blocks
                            .map(
                              (String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyles.light.copyWith(
                                    color: AppColors.buttonText,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        value: block,
                        hint: Text(
                          'Block*',
                          style: TextStyles.light
                              .copyWith(color: AppColors.buttonText),
                        ),
                        onChanged: (value) {
                          setState(
                            () {
                              block = value;
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          fillColor: AppColors.buttonBg,
                          filled: true,
                          contentPadding: EdgeInsets.all(16.0),
                        ),
                        onMenuStateChange: (isChanged) {
                          _formKey.currentState!.validate();
                        },
                        validator: (value) {
                          if (!streets.contains(value)) {
                            return 'This Field is mandatory';
                          }
                          return null;
                        },
                        items: streets
                            .map(
                              (String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyles.light.copyWith(
                                    color: AppColors.buttonText,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        value: street,
                        hint: Text(
                          'Street*',
                          style: TextStyles.light
                              .copyWith(color: AppColors.buttonText),
                        ),
                        onChanged: (value) {
                          setState(
                            () {
                              street = value;
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormField(
                        cursorColor: AppColors.primary,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(18.0),
                          hintText: AppStrings.keyAvenue,
                          fillColor: AppColors.buttonBg,
                          filled: true,
                          hintStyle: TextStyles.light.copyWith(
                            fontFamily: 'Sora',
                            color: AppColors.buttonText,
                            backgroundColor: AppColors.buttonBg,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormField(
                        cursorColor: AppColors.primary,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(18.0),
                          hintText: AppStrings.keyBuilding,
                          fillColor: AppColors.buttonBg,
                          filled: true,
                          hintStyle: TextStyles.light.copyWith(
                            fontFamily: 'Sora',
                            color: AppColors.buttonText,
                            backgroundColor: AppColors.buttonBg,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormField(
                        cursorColor: AppColors.primary,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(18.0),
                          hintText: AppStrings.keyFloor,
                          fillColor: AppColors.buttonBg,
                          filled: true,
                          hintStyle: TextStyles.light.copyWith(
                            fontFamily: 'Sora',
                            color: AppColors.buttonText,
                            backgroundColor: AppColors.buttonBg,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormField(
                        cursorColor: AppColors.primary,
                        validator: (value) {
                          if (value!.length > 1) {
                            return null;
                          }
                          return 'This field is mandatory.';
                        },
                        onChanged: (value) {
                          _formKey.currentState!.validate();
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(18.0),
                          hintText: AppStrings.keyHouseNo,
                          fillColor: AppColors.buttonBg,
                          filled: true,
                          hintStyle: TextStyles.light.copyWith(
                            fontFamily: 'Sora',
                            color: AppColors.buttonText,
                            backgroundColor: AppColors.buttonBg,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        AppStrings.keyAddressType,
                        style: TextStyles.regular.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.checkoutTextColor,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: id == 0
                                    ? AppColors.primary
                                    : AppColors.buttonBg,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0.w, vertical: 8.0.h),
                              child: Text(
                                AppStrings.keyAddressTypeOne,
                                style: TextStyles.regular.copyWith(
                                  color: id == 0
                                      ? AppColors.selectedButtonText
                                      : AppColors.greyText,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(
                                () {
                                  id = 0;
                                },
                              );
                            },
                          ),
                          SizedBox(
                            width: 10.0.w,
                          ),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: id == 1
                                    ? AppColors.primary
                                    : AppColors.buttonBg,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0.w, vertical: 8.0.h),
                              child: Text(
                                AppStrings.keyAddressTypeTwo,
                                style: TextStyles.regular.copyWith(
                                  color: id == 1
                                      ? AppColors.selectedButtonText
                                      : AppColors.greyText,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(
                                () {
                                  id = 1;
                                },
                              );
                            },
                          ),
                          SizedBox(
                            width: 10.0.w,
                          ),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: id == 2
                                    ? AppColors.primary
                                    : AppColors.buttonBg,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0.w, vertical: 8.0.h),
                              child: Text(
                                AppStrings.keyAddressTypeThree,
                                style: TextStyles.regular.copyWith(
                                  color: id == 2
                                      ? AppColors.selectedButtonText
                                      : AppColors.greyText,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(
                                () {
                                  id = 2;
                                },
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: CommonButton(
                  buttonPadding: const EdgeInsets.all(8.0),
                  prefixWidget: Text(
                    AppStrings.keySignUp,
                    style: TextStyles.semiBold.copyWith(
                      color: AppColors.selectedButtonText,
                      fontSize: 16.sp,
                    ),
                  ),
                  buttonText: ' ',
                  suffixWidget: const Icon(
                    Icons.arrow_forward_outlined,
                    color: AppColors.selectedButtonText,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomeScreen();
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

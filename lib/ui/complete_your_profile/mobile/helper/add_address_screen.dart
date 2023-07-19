import 'package:cardtrading/framework/controllers/complete_your_profile/complete_profile_controller.dart';
import 'package:cardtrading/ui/complete_your_profile/mobile/helper/add_address_header.dart';
import 'package:cardtrading/ui/complete_your_profile/mobile/helper/address_type_field.dart';
import 'package:cardtrading/ui/complete_your_profile/mobile/helper/sign_up_button.dart';
import 'package:cardtrading/ui/utils/theme/colors.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:cardtrading/ui/utils/theme/text_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final completeProfileWatch = ref.watch(completeProfileController);
        return Form(
          key: completeProfileWatch.secondPageFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AddAddressHeader(),
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
                          validator: (value) {
                            if (!completeProfileWatch.areas.contains(value)) {
                              return 'This Field is mandatory';
                            }
                            return null;
                          },
                          items: completeProfileWatch.areas
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
                          value: completeProfileWatch.area,
                          hint: Text(
                            'Area*',
                            style: TextStyles.light
                                .copyWith(color: AppColors.buttonText),
                          ),
                          onChanged: (value) {
                            completeProfileWatch.setArea(value);
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
                          validator: (value) {
                            if (!completeProfileWatch.blocks.contains(value)) {
                              return 'This Field is mandatory';
                            }
                            return null;
                          },
                          items: completeProfileWatch.blocks
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
                          value: completeProfileWatch.block,
                          hint: Text(
                            'Block*',
                            style: TextStyles.light
                                .copyWith(color: AppColors.buttonText),
                          ),
                          onChanged: (value) {
                            completeProfileWatch.setBlock(value);
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
                          validator: (value) {
                            if (!completeProfileWatch.streets.contains(value)) {
                              return 'This Field is mandatory';
                            }
                            return null;
                          },
                          items: completeProfileWatch.streets
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
                          value: completeProfileWatch.street,
                          hint: Text(
                            'Street*',
                            style: TextStyles.light
                                .copyWith(color: AppColors.buttonText),
                          ),
                          onChanged: (value) {
                            completeProfileWatch.setStreet(value);
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
                            completeProfileWatch.secondPageFormKey.currentState!
                                .validate();
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
                        const AddressTypeField()
                      ],
                    ),
                  ),
                ),
                const SignUpButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}

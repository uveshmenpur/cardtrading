import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardDetailsController = ChangeNotifierProvider((ref) {
  return CardDetailsController();
});

class CardDetailsController extends ChangeNotifier {
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
  final cardDetailDescription = [
    AppStrings.keyExpressShipping,
    AppStrings.keyAuthenticGuarantee,
    AppStrings.keySecurePayment,
  ];
  final cardDetailIcons = [
    '${AppAssets.svgLocation}shipping.svg',
    '${AppAssets.svgLocation}guarantee.svg',
    '${AppAssets.svgLocation}payment.svg',
  ];

  void setFavourite() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}

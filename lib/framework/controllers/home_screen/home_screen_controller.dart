import 'package:cardtrading/ui/utils/theme/assets.dart';
import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeScreenController = ChangeNotifierProvider(
  (ref) {
    return HomeScreenController();
  },
);

class HomeScreenController extends ChangeNotifier {
  final appBarActionList = [
    '${AppAssets.svgLocation}search.svg',
    '${AppAssets.svgLocation}shopping_cart.svg',
    '${AppAssets.svgLocation}notification.svg',
  ];
  final bottomNavigationBarSvgPath = [
    '${AppAssets.svgLocation}home.svg',
    '${AppAssets.svgLocation}portfolio.svg',
    '${AppAssets.svgLocation}store.svg',
    '${AppAssets.svgLocation}profile.svg',
  ];
  final bottomNavigationBarLabels = [
    AppStrings.keyHome,
    AppStrings.keyPortfolio,
    AppStrings.keyStore,
    AppStrings.keyProfile,
  ];
  String url = '${AppAssets.svgLocation}dark_mode.svg';
  int id = 0;

  void setId({int? newId}) {
    id = newId ?? id + 1;
    notifyListeners();
  }

  void changeMode() {
    url == '${AppAssets.svgLocation}dark_mode.svg'
        ? url = '${AppAssets.svgLocation}light_mode.svg'
        : url = '${AppAssets.svgLocation}dark_mode.svg';
    notifyListeners();
  }
}

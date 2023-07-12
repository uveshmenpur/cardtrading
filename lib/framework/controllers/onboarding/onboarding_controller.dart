import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onBoardingController = ChangeNotifierProvider(
  (ref) {
    return OnBoardingController();
  },
);

class OnBoardingController extends ChangeNotifier {
  int selectedPage = 0;

  List<String> onBoardingTitle = [
    AppStrings.keyOnBoardingTitle1,
    AppStrings.keyOnBoardingTitle2,
    AppStrings.keyOnBoardingTitle3
  ];
  List<String> onBoardingContent = [
    AppStrings.keyOnBoardingContent1,
    AppStrings.keyOnBoardingContent2,
    AppStrings.keyOnBoardingContent3
  ];
  void changePage(int index){
    selectedPage = index;
    notifyListeners();
  }
  void increment(){
    selectedPage++;
    notifyListeners();
  }
  void animateToNextPage(PageController pageController) {
    pageController.animateToPage(
      selectedPage,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }
}

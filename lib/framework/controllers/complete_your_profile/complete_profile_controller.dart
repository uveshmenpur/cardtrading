import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final completeProfileController =
    ChangeNotifierProvider((ref) => CompleteProfileController());

class CompleteProfileController extends ChangeNotifier {
  bool hasReferral = false;
  int page = 0;
  final _firstPageFormKey = GlobalKey<FormState>();
  final _secondPageFormKey = GlobalKey<FormState>();
  final PageController pageController = PageController();

  get firstPageFormKey => _firstPageFormKey;

  get secondPageFormKey => _secondPageFormKey;

  void addReferral() {
    hasReferral = true;
    notifyListeners();
  }

  void hideReferral() {
    hasReferral = false;
    notifyListeners();
  }

  String? area, block, street;
  int id = 0;
  List<String> areas = ['Isckon', 'Thaltej', 'NehruNagar', 'Bodakdev'];
  List<String> blocks = ['Isckon', 'Thaltej', 'NehruNagar', 'Bodakdev'];
  List<String> streets = ['Isckon', 'Thaltej', 'NehruNagar', 'Bodakdev'];
  List<String> addressTypes = [
    AppStrings.keyAddressTypeOne,
    AppStrings.keyAddressTypeTwo,
    AppStrings.keyAddressTypeThree
  ];

  void setArea(String? value) {
    area = value;
    notifyListeners();
  }

  void setBlock(String? value) {
    area = value;
    notifyListeners();
  }

  void setStreet(String? value) {
    area = value;
    notifyListeners();
  }

  String? validateEmail(String? value){
    if (!EmailValidator.validate(value!)) {
      return 'Enter Valid Email';
    }
    return null;
  }

  void setId(int newId) {
    id = newId;
    notifyListeners();
  }

  void changePage(int index){
    page = index;
    notifyListeners();
  }
  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    page++;
    notifyListeners();
  }

  void resetPage(){
    pageController.jumpToPage(0);
    notifyListeners();
  }
}

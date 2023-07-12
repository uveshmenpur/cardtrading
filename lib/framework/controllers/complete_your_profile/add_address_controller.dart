import 'package:cardtrading/ui/utils/theme/my_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addAddressController =
ChangeNotifierProvider((ref) => AddAddressController());

class AddAddressController extends ChangeNotifier {
  String? area, block, street;
  int id = 0;
  List<String> areas = ['Isckon', 'Thaltej', 'NehruNagar', 'Bodakdev'];
  List<String> blocks = ['Isckon', 'Thaltej', 'NehruNagar', 'Bodakdev'];
  List<String> streets = ['Isckon', 'Thaltej', 'NehruNagar', 'Bodakdev'];
  List<String> addressTypes = [AppStrings.keyAddressTypeOne, AppStrings.keyAddressTypeTwo, AppStrings.keyAddressTypeThree];
  void setArea(String? value){
    area = value;
    notifyListeners();
  }
  void setBlock(String? value){
    area = value;
    notifyListeners();
  }
  void setStreet(String? value){
    area = value;
    notifyListeners();
  }
  void setId(int newId){
    id = newId;
    notifyListeners();
  }
}

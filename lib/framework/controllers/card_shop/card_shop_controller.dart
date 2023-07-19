import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardShopController = ChangeNotifierProvider((ref){
  return CardShopController();
});

class CardShopController extends ChangeNotifier{
  int pageIndex = 0;
  void setOrIncrementPageIndex({int? index}){
    pageIndex = index ?? pageIndex + 1;
    notifyListeners();
  }
}
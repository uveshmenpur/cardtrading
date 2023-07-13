import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopCardController = ChangeNotifierProvider((ref){
  return ShopCardController();
});

class ShopCardController extends ChangeNotifier{
  bool isFavourite = false;
  void favourite() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
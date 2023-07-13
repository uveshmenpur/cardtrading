import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeScreenDrawerController = ChangeNotifierProvider((ref) {
  return HomeScreenDrawerController();
});

class HomeScreenDrawerController extends ChangeNotifier {
  final List<String> list = [
    ///List of items in Home Screen drawer
    'Home',
    'My Orders',
    'Favourites',
    'Subscription Plan',
    'Rewards',
    'Terms & Conditions',
    'Change Language',
    'Refer & Earn',
    'Contact Us',
    'About us',
    'FAQ',
  ];
  int id = 0;
  void setOrIncrementId({int? newId}){
    id = newId ?? id+1;
    notifyListeners();
  }
}

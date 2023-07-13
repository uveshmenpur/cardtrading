import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chooseLanguageController = ChangeNotifierProvider((ref){
  return ChooseLanguageController();
});

class ChooseLanguageController extends ChangeNotifier{
  List<String> languages = ['English', 'عربي'];
  String selectedLanguage = 'English';

  void changeLanguage(int index){
    selectedLanguage = languages[index];
    notifyListeners();
  }
}
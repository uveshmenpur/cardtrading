import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final completeProfileController =
    ChangeNotifierProvider((ref) => CompleteProfileController());

class CompleteProfileController extends ChangeNotifier {
  bool hasReferral = false;
  void addReferral(){
    hasReferral = !hasReferral;
    notifyListeners();
  }
}

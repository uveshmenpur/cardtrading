import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getOtpController = ChangeNotifierProvider(
  (ref) {
    return GetOtpController();
  },
);

class GetOtpController extends ChangeNotifier{
  int countDown = 59;
  late Timer timer;

  void changeCount(int count){
    countDown = count;
    notifyListeners();
  }



  void decrement(){
    countDown--;
    notifyListeners();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (countDown > 0) {
          decrement();
        } else {
          timer.cancel();
        }
      },
    );
  }
}

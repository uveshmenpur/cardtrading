import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkoutController = ChangeNotifierProvider((ref) {
  return CheckoutController();
});

class CheckoutController extends ChangeNotifier {
  List<CartModel> cartList = [
    CartModel(cardName: '2004 PANINI MEGA CRACKS LIONEL MESSI #71BIS', cardType: 'Exclusive', cardQty: 10, cardPrice: '214697.00'),
    CartModel(cardName: '2004 PANINI MEGA CRACKS LIONEL MESSI #71BIS', cardType: 'Exclusive', cardQty: 5, cardPrice: '214697.00'),
  ];

  void deleteCardFromCartList(int index){
    if(cartList.length >= 2){
      cartList.removeAt(index);
    }else{
      cartList[index].cardQty = 0;
    }
    notifyListeners();
  }
  void addCard(CartModel cartModel){
    cartList.add(cartModel);
    notifyListeners();
  }

  int uQty = 0;

  void increaseQty(int index){
    if(cartList[index].cardQty < 15){
      cartList[index].cardQty++;
    }
    notifyListeners();
  }

  void decreaseQty(int index){
    cartList[index].cardQty--;
    notifyListeners();
  }
}

class CartModel{
  String cardName;
  String cardType;
  int cardQty;
  String cardPrice;

  CartModel({
    required this.cardName,
    required this.cardType,
    required this.cardQty,
    required this.cardPrice,
  });

}

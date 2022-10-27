import 'package:flutter/cupertino.dart';

class MyRouterState extends ChangeNotifier {
  bool isOne = true;
  bool isTwo = false;
  bool isThree = false;

  void update({bool? one, bool? two, bool? three, bool? um, bool? dois, bool? tres}) {
    isOne = one ?? isOne;
    isTwo = two ?? isTwo;
    isThree = three ?? isThree;
    notifyListeners();
  }

  void updateWithInstance(MyRouterState state) {
    isOne = state.isOne;
    isTwo = state.isTwo;
    isThree = state.isThree;
    notifyListeners();
  }

  @override
  String toString() {
    return "isOne: $isOne \t isTwo: $isTwo \t isThree: $isThree";
  }

}
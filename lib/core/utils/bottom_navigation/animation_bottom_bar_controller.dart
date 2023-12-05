import 'package:flutter/material.dart';

class AnimationBottomBarController extends ChangeNotifier {
  int index;
  int? oldIndex;

  AnimationBottomBarController({this.index = 0});

  jumpTo(int index) {
    oldIndex = this.index;
    this.index = index;
    notifyListeners();
  }
}

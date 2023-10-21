import 'package:flutter/cupertino.dart';

class CarouselProvider extends ChangeNotifier {
  int _activeIndex = 3;

  void updateActiveIndex(int newIndex) {
    _activeIndex = newIndex;
    notifyListeners();
  }

  get activeIndex => _activeIndex;
}

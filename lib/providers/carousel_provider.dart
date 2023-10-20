import 'package:flutter/cupertino.dart';

class CarouselProvider extends ChangeNotifier {
  int _activeIndex = 0;

  void updateActiveIndex(int newIndex) {
    _activeIndex = newIndex;
    notifyListeners();
  }

  get activeIndex => _activeIndex;
}

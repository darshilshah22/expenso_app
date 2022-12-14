import 'package:flutter/cupertino.dart';

class ExpandDropdownProvider with ChangeNotifier {
  bool _isExpand = false;
  int? _index;

  bool get isExpand => _isExpand;
  int? get index => _index;

  set expand(bool value) {
    _isExpand = value;
    notifyListeners();
  }

  set setIndex(int? value) {
    _index = value;
    notifyListeners();
  }
}

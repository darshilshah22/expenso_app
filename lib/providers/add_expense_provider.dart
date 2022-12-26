import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AddExpenseProvider with ChangeNotifier {
  String _type = '';
  String _expenseType = '';
  String _paymentType = '';
  String _name = '';
  int _amount = 0;
  String _category = '';
  String _date = '';
  int? _totalBal;
  int? _incomeBal;
  int? _expenseBal;

  String get type => _type;
  String get expenseType => _expenseType;
  String get paymentType => _paymentType;
  String get name => _name;
  int get amount => _amount;
  String get category => _category;
  String get date => _date;
  int? get totalBal => _totalBal;
  int? get incomeBal => _incomeBal;
  int? get expenseBal => _expenseBal;

  void setType(String value) {
    _type = value;
    notifyListeners();
  }

  void setExpenseType(String value) {
    _expenseType = value;
    notifyListeners();
  }

  void setPaymentType(String value) {
    _paymentType = value;
    notifyListeners();
  }

  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setAmount(int value) {
    _amount = value;
    notifyListeners();
  }

  void setCategory(String value) {
    _category = value;
    notifyListeners();
  }

  void setDate(String value) {
    _date = value;
    notifyListeners();
  }

  void setTotalBal(int? value) {
    _totalBal = value;
    notifyListeners();
  }

  void setIncomeBal(int? value) {
    _incomeBal = value;
    notifyListeners();
  }

  void setExpenseBal(int? value) {
    _expenseBal = value;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:time_tracker/models/transaction_model.dart';

class AddExpenseProvider with ChangeNotifier {
  String _type = '';
  String _name = '';
  int _amount = 0;
  String _category = '';
  String _date = '';
  List<TransactionModel> _transactions = [];

  String get type => _type;
  String get name => _name;
  int get amount => _amount;
  String get category => _category;
  String get date => _date;
  List<TransactionModel> get transactions => _transactions;

  void setType(String value) {
    _type = value;
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

  void addTransactions(TransactionModel value) {
    _transactions.add(value);
    notifyListeners();
  }
}

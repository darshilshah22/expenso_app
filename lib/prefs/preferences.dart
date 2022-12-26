import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../models/transaction_model.dart';

class Preferences {
  setList(List<TransactionModel> transaction) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final String encodedData = TransactionModel.encode(transaction);
    await prefs.setString(transactions, encodedData);
  }

  Future<List<TransactionModel>> getList() async {
    List<TransactionModel> transaction = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final String transactionString = prefs.getString(transactions) ?? "";

    if (transactionString.isNotEmpty) {
      transaction = TransactionModel.decode(transactionString);
      return transaction;
    } else {
      return transaction;
    }
  }

  setBal(String key, int val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, val);
  }

  Future<int> getBal(String key) async {
    int? bal;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bal = prefs.getInt(key) ?? 0;
    return bal;
  }
}

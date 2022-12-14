import 'package:shared_preferences/shared_preferences.dart';

import '../models/transaction_model.dart';

class Preferences {
  static const String transactions = "transactions";

  setList(List<TransactionModel> transaction) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final String encodedData = TransactionModel.encode(transaction);
    await prefs.setString(transactions, encodedData);
  }

  Future<List<TransactionModel>> getList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? transactionString = prefs.getString(transactions);
    final List<TransactionModel> transaction =
        TransactionModel.decode(transactionString!);

    return transaction;
  }
}

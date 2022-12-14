import 'dart:convert';

class TransactionModel {
  String? name;
  String? transactionType;
  int? amount;
  String? category;
  String? date;
  String? expenseType;
  String? paymentType;

  TransactionModel(
      {this.name,
      this.transactionType,
      this.amount,
      this.category,
      this.date,
      this.expenseType,
      this.paymentType});

  factory TransactionModel.fromJson(Map<String, dynamic> jsonData) {
    return TransactionModel(
      name: jsonData['name'],
      transactionType: jsonData['transaction_type'],
      amount: jsonData['amount'],
      category: jsonData['category'],
      date: jsonData['date'],
      expenseType: jsonData['expense_type'],
      paymentType: jsonData['payment_type'],
    );
  }

  static Map<String, dynamic> toMap(TransactionModel transaction) => {
        'name': transaction.name,
        'transaction_type': transaction.transactionType,
        'amount': transaction.amount,
        'category': transaction.category,
        'date': transaction.date,
        'expense_type': transaction.expenseType,
        'payment_type': transaction.paymentType,
      };

  static String encode(List<TransactionModel> transactions) => json.encode(
        transactions
            .map<Map<String, dynamic>>((t) => TransactionModel.toMap(t))
            .toList(),
      );

  static List<TransactionModel> decode(String t) =>
      (json.decode(t) as List<dynamic>)
          .map<TransactionModel>((item) => TransactionModel.fromJson(item))
          .toList();
}

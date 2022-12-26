import 'package:flutter/material.dart';

import '../widgets/custom_dialog.dart';

push(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

List<String> categories = [
  "Shopping",
  "Transportation",
  "Travel",
  "Entertainment",
  "Groceries",
  "Stationary",
  "Other"
];

List<String> transactionType = ['Expense', 'Income'];

List<String> paymentType = ['Online', 'Cash'];

List<String> expenseType = ['Want', 'Need', 'Investment'];

const String transactions = "transactions";

const String TOTAL_BALANCE = "totalBal";
const String EXPENSE_BALANCE = "expenseBal";
const String INCOME_BALANCE = "incomeBal";

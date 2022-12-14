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

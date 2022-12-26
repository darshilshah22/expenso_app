import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/constants/string_const.dart';
import 'package:time_tracker/models/transaction_model.dart';
import 'package:time_tracker/prefs/preferences.dart';
import 'package:time_tracker/widgets/CustomDatePicker.dart';
import 'package:time_tracker/widgets/bottom_navigation_bar.dart';
import 'package:time_tracker/widgets/customDropdown.dart';

import '../constants/constants.dart';
import '../dark_theme_style.dart';
import '../providers/add_expense_provider.dart';
import '../providers/expand_dropdown_provider.dart';
import '../widgets/button_widget.dart';
import '../widgets/widget_heading.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  late FocusNode _name;
  late FocusNode _amount;
  late FocusNode _category;
  bool isShowPass = false;
  String type = '';
  String prefix = '';
  int? totalBal;
  int? incomeBal;
  int? expenseBal;
  List<TransactionModel> transactions = [];
  Preferences prefs = Preferences();

  @override
  void initState() {
    super.initState();
    _name = FocusNode();
    _amount = FocusNode();
    _category = FocusNode();
    Provider.of<AddExpenseProvider>(context, listen: false).setType('');
    getTransaction();
  }

  getTransaction() async {
    transactions = await prefs.getList();
    totalBal = await prefs.getBal(TOTAL_BALANCE);
    incomeBal = await prefs.getBal(INCOME_BALANCE);
    expenseBal = await prefs.getBal(EXPENSE_BALANCE);
    setState(() {});
  }

  @override
  void dispose() {
    _name.dispose();
    _amount.dispose();
    _category.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back_ios, color: Colors.black),
                      HeadingWidget(text: 'Add Expense'),
                    ],
                  ),
                ),
              ),
              _buildAddExpense()
            ],
          ),
        ));
  }

  Widget _buildAddExpense() {
    final provider = Provider.of<AddExpenseProvider>(context, listen: false);
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(0, 4),
                blurRadius: 16),
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(4, 0),
                blurRadius: 16)
          ], borderRadius: BorderRadius.circular(18), color: Colors.white),
          child: Column(
            children: [
              const SizedBox(height: 40),
              CustomDropdown(
                type: type,
                hint: strType,
                list: transactionType,
                func: () {
                  setState(() {
                    type = strType;
                  });
                  _name.unfocus();
                  _amount.unfocus();
                  if (Provider.of<ExpandDropdownProvider>(context,
                              listen: false)
                          .isExpand &&
                      type == strType) {
                    setState(() {
                      type = '';
                    });
                    Provider.of<ExpandDropdownProvider>(context, listen: false)
                        .expand = false;
                  } else {
                    Provider.of<ExpandDropdownProvider>(context, listen: false)
                        .expand = true;
                  }
                },
                setValue: (index) {
                  Provider.of<AddExpenseProvider>(context, listen: false)
                      .setType(transactionType[index!]);
                },
              ),
              if (Provider.of<AddExpenseProvider>(context, listen: true).type ==
                  'Expense')
                const SizedBox(height: 30),
              if (Provider.of<AddExpenseProvider>(context, listen: true).type ==
                  'Expense')
                CustomDropdown(
                  type: type,
                  hint: strExpenseType,
                  list: expenseType,
                  func: () {
                    setState(() {
                      type = strExpenseType;
                    });
                    _name.unfocus();
                    _amount.unfocus();
                    if (Provider.of<ExpandDropdownProvider>(context,
                                listen: false)
                            .isExpand &&
                        type == strExpenseType) {
                      setState(() {
                        type = '';
                      });
                      Provider.of<ExpandDropdownProvider>(context,
                              listen: false)
                          .expand = false;
                    } else {
                      Provider.of<ExpandDropdownProvider>(context,
                              listen: false)
                          .expand = true;
                    }
                  },
                  setValue: (index) {
                    provider.setExpenseType(expenseType[index!]);
                  },
                ),
              //Text(Provider.of<AddExpenseProvider>(context, listen: true).type),
              const SizedBox(height: 30),
              _buildTextField(strName, _name, nameController, false),
              const SizedBox(height: 30),
              _buildTextField(strAmount, _amount, amountController, true),
              const SizedBox(height: 30),
              CustomDropdown(
                type: type,
                hint: strPaymentType,
                list: paymentType,
                func: () {
                  setState(() {
                    type = strPaymentType;
                  });
                  _name.unfocus();
                  _amount.unfocus();
                  if (Provider.of<ExpandDropdownProvider>(context,
                              listen: false)
                          .isExpand &&
                      type == strType) {
                    setState(() {
                      type = '';
                    });
                    Provider.of<ExpandDropdownProvider>(context, listen: false)
                        .expand = false;
                  } else {
                    Provider.of<ExpandDropdownProvider>(context, listen: false)
                        .expand = true;
                  }
                },
                setValue: (index) {
                  Provider.of<AddExpenseProvider>(context, listen: false)
                      .setPaymentType(paymentType[index!]);
                },
              ),
              const SizedBox(height: 30),
              CustomDropdown(
                type: type,
                hint: strCategories,
                list: categories,
                func: () {
                  setState(() {
                    type = strCategories;
                  });
                  _name.unfocus();
                  _amount.unfocus();
                  if (Provider.of<ExpandDropdownProvider>(context,
                              listen: false)
                          .isExpand &&
                      type == strCategories) {
                    setState(() {
                      type = '';
                    });
                    Provider.of<ExpandDropdownProvider>(context, listen: false)
                        .expand = false;
                  } else {
                    Provider.of<ExpandDropdownProvider>(context, listen: false)
                        .expand = true;
                  }
                },
                setValue: (index) {
                  if (categories[index!] == "Other") {
                    showOtherDialog(context);
                  } else {
                    provider.setCategory(categories[index]);
                  }
                },
              ),
              // Text(Provider.of<AddExpenseProvider>(context, listen: true)
              //     .category),
              const SizedBox(height: 30),
              CustomDatePicker(
                value: "Date",
                icon: Image.asset('assets/icons/calendar.png', height: 24),
              ),
              const SizedBox(height: 30),
              ButtonWidget('Submit', () {
                TransactionModel transactionModel = TransactionModel(
                    name: nameController.text,
                    transactionType:
                        Provider.of<AddExpenseProvider>(context, listen: false)
                            .type,
                    amount: int.parse(amountController.text),
                    category:
                        Provider.of<AddExpenseProvider>(context, listen: false)
                            .category,
                    date:
                        Provider.of<AddExpenseProvider>(context, listen: false)
                            .date,
                    expenseType:
                        Provider.of<AddExpenseProvider>(context, listen: false)
                            .expenseType,
                    paymentType:
                        Provider.of<AddExpenseProvider>(context, listen: false)
                            .paymentType);

                if (provider.type == "Expense") {
                  expenseBal = expenseBal! + int.parse(amountController.text);
                  totalBal = totalBal! - int.parse(amountController.text);
                  prefs.setBal(EXPENSE_BALANCE, expenseBal!);
                } else {
                  incomeBal = incomeBal! + int.parse(amountController.text);
                  totalBal = totalBal! + int.parse(amountController.text);
                  prefs.setBal(INCOME_BALANCE, incomeBal!);
                }
                transactions.add(transactionModel);
                prefs.setList(transactions);
                prefs.setBal(TOTAL_BALANCE, totalBal!);

                push(context, const BottomNavigation());
              }),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, FocusNode fnode,
      TextEditingController controller, bool isNumber) {
    return TextFormField(
      controller: controller,
      focusNode: fnode,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      textInputAction: isNumber ? TextInputAction.done : TextInputAction.next,
      cursorColor: Colors.black,
      style: const TextStyle(fontSize: 16),
      onChanged: (text) {
        if (isNumber) {
          setState(() {
            prefix = '₹ ';
          });
        }
      },
      onTap: () {
        Provider.of<ExpandDropdownProvider>(context, listen: false).expand =
            false;
      },
      onFieldSubmitted: (value) {
        if (isNumber) {
          setState(() {
            type = strCategories;
          });
          _name.unfocus();
          _amount.unfocus();
          Provider.of<ExpandDropdownProvider>(context, listen: false).expand =
              true;
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.4))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Styles.themeData(false, context).primaryColor,
                width: 2)),
        prefixText: isNumber ? prefix : '',
        prefixStyle: const TextStyle(fontSize: 16),
        hintText: hint,
        hintStyle: TextStyle(
          letterSpacing: 0.6,
          fontSize: 16,
          color: const Color(0xff666666).withOpacity(0.5),
        ),
      ),
    );
  }

  showOtherDialog(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
            color: Colors.white,
            height: MediaQuery.of(context).size.height / 3.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Add New Category",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 30),
                _buildTextField(
                    strCategories, _category, categoryController, false),
                ButtonWidget("Add", () {
                  Provider.of<ExpandDropdownProvider>(context, listen: false)
                      .expand = false;

                  Provider.of<AddExpenseProvider>(context, listen: false)
                      .setCategory(categoryController.text);
                  Navigator.of(context).pop();
                })
              ],
            ),
          ),
        );
      },
    );
  }
}

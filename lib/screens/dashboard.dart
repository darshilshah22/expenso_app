import 'package:flutter/material.dart';
import 'package:time_tracker/constants/string_const.dart';
import 'package:time_tracker/dark_theme_style.dart';
import 'package:time_tracker/models/transaction_model.dart';
import 'package:time_tracker/prefs/preferences.dart';
import 'package:time_tracker/screens/add_expense.dart';
import 'package:time_tracker/widgets/widget_heading.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<TransactionModel> transactions = [];
  Preferences? prefs;

  @override
  void initState() {
    prefs = Preferences();
    getTransactions();
    super.initState();
  }

  getTransactions() async {
    transactions = await prefs!.getList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeadingWidget(text: strDash),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddExpense()));
                    },
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          color: Styles.themeData(false, context).primaryColor),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 40),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    offset: const Offset(0, 4),
                    blurRadius: 16),
                BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    offset: const Offset(4, 0),
                    blurRadius: 16)
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    strTotalBal,
                    style: TextStyle(
                        color: Styles.themeData(false, context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "10,000 ₹",
                    style: TextStyle(
                        color: Styles.themeData(false, context).primaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/icons/income.png',
                                  color: Styles.themeData(false, context)
                                      .primaryColor,
                                  height: 24),
                              const SizedBox(width: 8),
                              Text(
                                strIncome,
                                style: TextStyle(
                                    color: Styles.themeData(false, context)
                                        .primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "10,000 ₹",
                            style: TextStyle(
                                color: Styles.themeData(false, context)
                                    .primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/expense.png',
                                height: 24,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                strExpense,
                                style: TextStyle(
                                    color: Styles.themeData(false, context)
                                        .primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "10,000 ₹",
                            style: TextStyle(
                                color: Styles.themeData(false, context)
                                    .primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            _buildOverview()
          ],
        ),
      ),
    );
  }

  Widget _buildOverview() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      strTransHistory,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      strSeeAll,
                      style: const TextStyle(
                          color: Color(0xff666666),
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTransactionHistory()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionHistory() {
    //getTransactions();
    return ListView.builder(
        shrinkWrap: true,
        itemCount: transactions.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding:
                const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
            decoration: BoxDecoration(
              color: const Color(0xffFBFBFB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      transactions[index].name!,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      transactions[index].date!,
                      style: const TextStyle(
                          color: Color(0xff666666),
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Text(
                  "${transactions[index].amount!.toString()} ₹",
                  style: TextStyle(
                      color: transactions[index].transactionType == "Expense"
                          ? Colors.red
                          : Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        });
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}

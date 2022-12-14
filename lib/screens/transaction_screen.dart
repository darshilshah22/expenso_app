import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:time_tracker/constants/string_const.dart';
import 'package:time_tracker/dark_theme_style.dart';
import 'package:time_tracker/screens/dashboard.dart';

import '../widgets/widget_heading.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<ChartData> chartData = [
    ChartData('Sun', 35),
    ChartData('Mon', 13),
    ChartData('Tue', 34),
    ChartData('Wed', 27),
    ChartData('Thu', 40),
    ChartData('Fri', 48),
    ChartData('Sat', 20),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
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
                margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: HeadingWidget(text: strStatistics),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                    left: 20, top: 24, right: 20, bottom: 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          offset: const Offset(0, 4),
                          blurRadius: 16),
                      BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          offset: const Offset(4, 0),
                          blurRadius: 16)
                    ]),
                clipBehavior: Clip.hardEdge,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: false,
                  physics: const NeverScrollableScrollPhysics(),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                    color: Styles.themeData(false, context).primaryColor,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: EdgeInsets.zero,
                  labelColor: Colors.white,
                  unselectedLabelColor: const Color(0xFFA29EB6),
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(
                      text: strDay,
                    ),
                    Tab(
                      text: strWeek,
                    ),
                    Tab(
                      text: strMonth,
                    ),
                    Tab(
                      text: strYear,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildAnalytics(),
                    _buildAnalytics(),
                    _buildAnalytics(),
                    _buildAnalytics()
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildAnalytics() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 6, left: 6, bottom: 20),
            child: SfCartesianChart(
                plotAreaBorderColor: Colors.transparent,
                primaryYAxis: NumericAxis(isVisible: false),
                primaryXAxis: CategoryAxis(
                  isVisible: true,
                  borderColor: Colors.white,
                  majorTickLines:
                      const MajorTickLines(color: Colors.transparent),
                  majorGridLines:
                      const MajorGridLines(color: Colors.transparent),
                  axisLine: const AxisLine(color: Colors.white),
                ),
                tooltipBehavior: TooltipBehavior(
                    textStyle: const TextStyle(color: Colors.black),
                    enable: true,
                    borderColor: Styles.themeData(false, context).primaryColor,
                    borderWidth: 1,
                    header: '',
                    format: 'point.y',
                    color: Colors.white),
                series: <ChartSeries>[
                  SplineAreaSeries<ChartData, String>(
                      dataSource: chartData,
                      splineType: SplineType.cardinal,
                      borderWidth: 3,
                      borderColor:
                          Styles.themeData(false, context).primaryColor,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Styles.themeData(false, context)
                                .primaryColor
                                .withOpacity(0.1),
                            Colors.white
                          ]),
                      xValueMapper: (ChartData data, _) {
                        return data.x;
                      },
                      yValueMapper: (ChartData data, _) => data.y,
                      enableTooltip: true,
                      markerSettings: MarkerSettings(
                        isVisible: false,
                        color: Styles.themeData(false, context).primaryColor,
                        borderColor:
                            Styles.themeData(false, context).primaryColor,
                      ))
                ]),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Row(
              children: [
                Text(
                  strTopSpending,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Image.asset('assets/icons/filter.png', height: 24),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: _buildTransactionHistory(),
          )
        ],
      ),
    );
  }

  Widget _buildTransactionHistory() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 10,
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
                  children: [
                    Text(
                      strExpense,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      strSeeAll,
                      style: const TextStyle(
                          color: Color(0xff666666),
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                const Text(
                  "+1000 ₹",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        });
  }
}

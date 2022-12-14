import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/add_expense_provider.dart';

class CustomDatePicker extends StatefulWidget {
  final String? value;
  final Widget? icon;
  const CustomDatePicker({this.value, this.icon, Key? key}) : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime date = DateTime.now();
  String d = DateFormat('EEE, dd MMM yyyy').format(DateTime.now());
  TimeOfDay time = TimeOfDay.now();

  @override
  void initState() {
    Provider.of<AddExpenseProvider>(context, listen: false).setDate(d);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectDateRange,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.withOpacity(0.4),
            )),
        padding: const EdgeInsets.only(left: 16, right: 4, top: 10, bottom: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Text(
                d,
                style: TextStyle(
                  letterSpacing: d.isEmpty ? 0.6 : 0,
                  fontSize: 16,
                  color: d.isEmpty
                      ? const Color(0xff666666).withOpacity(0.5)
                      : Colors.black,
                ),
              ),
            ),
            const Spacer(),
            const RotatedBox(
              quarterTurns: 1,
              child: Divider(
                indent: 8,
                endIndent: 8,
                color: Colors.black38,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: widget.icon,
            ),
          ],
        ),
      ),
    );
  }

  selectDateRange() async {
    FocusManager.instance.primaryFocus!.unfocus();
    DateTime? newDate = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year, DateTime.now().month - 1),
        context: context,
        lastDate: DateTime.now());
    setState(() {
      date = newDate ?? date;
      d = DateFormat('EEE, dd MMM yyyy').format(date);
      Provider.of<AddExpenseProvider>(context, listen: false).setDate(d);
      // if(widget.title == strDate) {
      //   context
      //       .read<ComplaintViewModel>()
      //       .setDate(d);
      // }else if(widget.title == strCompleteDate){
      //   context
      //       .read<ComplaintViewModel>()
      //       .setCompletedDate(d);
      // }
    });
    // } else {
    //   TimeOfDay? newTime = await showTimePicker(
    //     context: context,
    //     initialTime: TimeOfDay.now(),
    //   );
    //   setState(() {
    //     time = newTime ?? time;
    //     // d = time.format(context);
    //     // if(widget.title == strTime) {
    //     //   context
    //     //       .read<ComplaintViewModel>()
    //     //       .setTime(d);
    //     // }else if(widget.title == strCompleteTime){
    //     //   context
    //     //       .read<ComplaintViewModel>()
    //     //       .setCompletedTime(d);
    //     // }
    //   });
    // }
  }
}

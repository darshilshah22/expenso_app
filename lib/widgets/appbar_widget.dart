import 'package:flutter/material.dart';

import 'widget_heading.dart';

class AppBarWidget extends StatelessWidget {
  final String? title;
  final bool? isPop;
  final Widget? actions;

  const AppBarWidget({
    Key? key,
    this.title,
    this.isPop,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Row(
          children: [
            if (isPop!) const Icon(Icons.arrow_back_ios, color: Colors.black),
            HeadingWidget(text: title!),
          ],
        ),
      ),
    );
  }
}

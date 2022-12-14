import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:time_tracker/dark_theme_style.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final VoidCallback func;
  const ButtonWidget(this.text, this.func, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Styles.themeData(false, context).primaryColor),
        child: Text(text!,
            style: const TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }
}

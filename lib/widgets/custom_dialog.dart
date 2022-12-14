import 'package:flutter/material.dart';
import 'package:time_tracker/dark_theme_style.dart';
import 'package:time_tracker/widgets/button_widget.dart';

class CustomDialogBox extends StatefulWidget {
  final String firstBtnTitle;
  final String secondBtnTitle;
  final String title;
  final String? subtitle;
  final Color? color;

  final VoidCallback? onClickedfirstbtn;
  final VoidCallback? onClickedsecondbtn;

  CustomDialogBox(
      {this.firstBtnTitle = '',
      this.secondBtnTitle = '',
      this.title = '',
      this.onClickedfirstbtn,
      this.onClickedsecondbtn,
      this.subtitle,
      this.color});
  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: widget.title.isNotEmpty ? true : false,
                child: Text(
                  widget.title,
                  style: TextStyle(
                      height: 1.6,
                      fontWeight: FontWeight.bold,
                      color: Styles.themeData(false, context).primaryColor,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.subtitle!,
                  textAlign: TextAlign.center,
                  maxLines: 12,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                      color: Colors.grey.shade600,
                      fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.20,
                        child: ButtonWidget("Okay", () {}),
                      ),
                    ),
                    Visibility(
                      visible: widget.secondBtnTitle.isNotEmpty ? true : false,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: ButtonWidget("Okay", () {}),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

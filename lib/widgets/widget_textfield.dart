import 'package:flutter/material.dart';
import 'package:time_tracker/dark_theme_style.dart';

class WidgetTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? icon;
  final FocusNode? focusNode;
  final Widget? suffix;
  final VoidCallback? func;
  final Function(String)? submit;

  const WidgetTextField(
      {this.controller,
      this.hint,
      this.icon,
      this.focusNode,
      this.suffix,
      this.func,
      this.submit,
      Key? key})
      : super(key: key);

  @override
  State<WidgetTextField> createState() => _WidgetTextFieldState();
}

class _WidgetTextFieldState extends State<WidgetTextField> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: widget.focusNode!.hasFocus
                  ? Styles.themeData(false, context).primaryColor
                  : Colors.transparent),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(0, 1),
                blurRadius: 8)
          ],
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            widget.icon!,
            height: 24,
          ),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              textInputAction: TextInputAction.next,
              cursorColor: Styles.themeData(false, context).primaryColor,
              style: const TextStyle(fontSize: 16),
              onTap: widget.func,
              onFieldSubmitted: widget.submit,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 8, top: 16, bottom: 16),
                  border: InputBorder.none,
                  isDense: true,
                  hintText: widget.hint,
                  suffixIcon: widget.suffix),
            ),
          ),
        ],
      ),
    );
  }
}

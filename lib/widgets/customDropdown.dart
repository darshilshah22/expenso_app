import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/dark_theme_style.dart';
import 'package:time_tracker/providers/expand_dropdown_provider.dart';

import '../providers/add_expense_provider.dart';

class CustomDropdown extends StatefulWidget {
  final String? hint;
  final List<String>? list;
  final VoidCallback func;
  final Function(int? index)? setValue;
  String? type;
  CustomDropdown(
      {this.hint,
      this.list,
      required this.func,
      this.type,
      this.setValue,
      Key? key})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool _isExpanded = false;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpandDropdownProvider>(context, listen: true);
    _isExpanded = provider.isExpand;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: widget.func,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 16, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(
                      color: _isExpanded && widget.type! == widget.hint
                          ? Styles.themeData(false, context).primaryColor
                          : Colors.grey.withOpacity(0.4),
                      width:
                          _isExpanded && widget.type! == widget.hint ? 2 : 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedIndex != null
                        ? widget.list![selectedIndex!] == 'Other'
                            ? Provider.of<AddExpenseProvider>(context,
                                    listen: true)
                                .category
                            : widget.list![selectedIndex!]
                        : widget.hint!,
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: selectedIndex == null ? 0.6 : 0,
                      color: selectedIndex == null
                          ? const Color(0xff666666).withOpacity(0.5)
                          : Colors.black,
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: _isExpanded && widget.type == widget.hint
                          ? const RotatedBox(
                              quarterTurns: 2,
                              child: Image(
                                image:
                                    AssetImage('assets/icons/arrow-down-2.png'),
                                height: 26,
                              ),
                            )
                          : const Image(
                              image:
                                  AssetImage('assets/icons/arrow-down-2.png'),
                              height: 26,
                            )),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: _isExpanded && widget.type == widget.hint,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInToLinear,
            margin: const EdgeInsets.only(top: 3),
            padding: const EdgeInsets.only(left: 10, bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 6),
                  blurRadius: 20,
                  color: Colors.black.withOpacity(0.23),
                ),
              ],
              color: Colors.white,
            ),
            child: ListView.builder(
              itemCount: widget.list!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      Provider.of<ExpandDropdownProvider>(context,
                              listen: false)
                          .expand = false;
                      widget.setValue!(index);
                    });
                  },
                  child: Container(
                      margin: const EdgeInsets.only(top: 12, right: 8),
                      padding:
                          const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                      color: selectedIndex == index
                          ? Colors.grey.withOpacity(0.1)
                          : Colors.transparent,
                      child: Text(
                        widget.list![index],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: selectedIndex == index
                                ? FontWeight.w800
                                : FontWeight.w500),
                      )),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

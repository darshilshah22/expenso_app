import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 20, bottom: 10, top: 30),
      padding: const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
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
      child: Row(
        children: [Image.asset("assets/icons/search.png", height: 24), const Text('Search', style: TextStyle(),)],
      ),
    );
  }
}

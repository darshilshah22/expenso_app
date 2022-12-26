import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:time_tracker/constants/string_const.dart';
import 'package:time_tracker/dark_theme_style.dart';
import 'package:time_tracker/widgets/appbar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(title: strProfile, isPop: false),
            _buildProfileSection(),
            _buildSettingMenus()
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: Styles.themeData(false, context).primaryColor,
                  width: 2),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 15,
                    color: const Color(0xff000000).withOpacity(0.05))
              ],
            ),
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/icons/profile.jpg"),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Jenny Adams",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10),
              Text(
                "abcd@example.com",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.black.withOpacity(0.4)),
              ),
            ],
          ),
          const Spacer(),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.1))),
              child:
                  Image.asset("assets/icons/edit.png", height: 20, width: 20))
        ],
      ),
    );
  }

  Widget _buildSettingMenus() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, top: 30, right: 20),
            padding: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.4)))),
            child: const Text(
              "Account",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
            padding: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.4)))),
            child: const Text(
              "Settings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
            padding: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.4)))),
            child: const Text(
              "Export Data",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
            padding: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.4)))),
            child: const Text(
              "Share App",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
            padding: const EdgeInsets.only(bottom: 30),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.4)))),
            child: const Text(
              "Logout",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w800, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:time_tracker/constants/constants.dart';
import 'package:time_tracker/constants/string_const.dart';
import 'package:time_tracker/dark_theme_style.dart';
import 'package:time_tracker/screens/Authentication/signin.dart';
import 'package:time_tracker/widgets/appbar_widget.dart';
import 'package:time_tracker/widgets/button_widget.dart';
import 'package:time_tracker/widgets/widget_heading.dart';
import 'package:time_tracker/widgets/widget_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  late FocusNode _name;
  late FocusNode _email;
  late FocusNode _pass;
  late FocusNode _cpass;
  bool isShowPass = false;
  bool isShowCPass = false;

  @override
  void initState() {
    super.initState();
    _name = FocusNode();
    _email = FocusNode();
    _pass = FocusNode();
    _cpass = FocusNode();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _pass.dispose();
    _cpass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 10),
                child: AppBarWidget(title: strSignup, isPop: false)),
            const SizedBox(height: 20),
            WidgetTextField(
              controller: nameController,
              focusNode: _name,
              hint: strfname,
              suffix: const SizedBox(),
              func: () {
                setState(() {
                  _name.requestFocus();
                });
              },
              submit: (term) {
                _name.unfocus();
                FocusScope.of(context).requestFocus(_pass);
                setState(() {});
              },
            ),
            WidgetTextField(
              controller: emailController,
              focusNode: _email,
              hint: strEmail,
              suffix: const SizedBox(),
              func: () {
                setState(() {
                  _name.requestFocus();
                });
              },
              submit: (term) {
                _name.unfocus();
                FocusScope.of(context).requestFocus(_pass);
                setState(() {});
              },
            ),
            WidgetTextField(
              controller: passController,
              focusNode: _pass,
              hint: strpassword,
              suffix: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  "assets/icons/eyes.png",
                  height: 16,
                  color: isShowPass
                      ? Styles.themeData(false, context).primaryColor
                      : Colors.grey,
                ),
              ),
              func: () {
                setState(() {
                  _pass.requestFocus();
                });
              },
              submit: (term) {
                _pass.unfocus();
                FocusScope.of(context).requestFocus(_cpass);
                setState(() {});
              },
            ),
            WidgetTextField(
              controller: confirmPassController,
              focusNode: _cpass,
              hint: strconfirmpassword,
              suffix: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  "assets/icons/eyes.png",
                  height: 10,
                  color: isShowCPass
                      ? Styles.themeData(false, context).primaryColor
                      : Colors.grey,
                ),
              ),
              func: () {
                setState(() {
                  _cpass.requestFocus();
                  setState(() {});
                });
              },
              submit: (term) {
                _cpass.unfocus();
              },
            ),
            ButtonWidget(strSignup, () {}),
            GestureDetector(
              onTap: () {
                push(context, const SignIn());
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      strhaveanacc,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      strSignin,
                      style: TextStyle(
                          color: Styles.themeData(false, context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

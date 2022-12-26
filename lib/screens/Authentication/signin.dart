import 'package:flutter/material.dart';
import 'package:time_tracker/constants/constants.dart';
import 'package:time_tracker/constants/string_const.dart';
import 'package:time_tracker/dark_theme_style.dart';
import 'package:time_tracker/screens/Authentication/signup.dart';
import 'package:time_tracker/widgets/appbar_widget.dart';
import 'package:time_tracker/widgets/button_widget.dart';
import 'package:time_tracker/widgets/widget_heading.dart';
import 'package:time_tracker/widgets/widget_textfield.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  late FocusNode _email;
  late FocusNode _pass;
  bool isShowPass = false;

  @override
  void initState() {
    super.initState();
    _email = FocusNode();
    _pass = FocusNode();
  }

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
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
            GestureDetector(
              child: WidgetTextField(
                controller: emailController,
                focusNode: _email,
                hint: strEmail,
                suffix: const SizedBox(),
                func: () {
                  setState(() {
                    _email.requestFocus();
                  });
                },
                submit: (term) {
                  _email.unfocus();
                  FocusScope.of(context).requestFocus(_pass);
                  setState(() {});
                },
              ),
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
                setState(() {});
              },
            ),
            ButtonWidget(strSignin, () {}),
            GestureDetector(
              onTap: () {
                push(context, const SignUp());
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      strSignup,
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

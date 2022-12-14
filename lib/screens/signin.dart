import 'package:flutter/material.dart';
import 'package:time_tracker/constants/constants.dart';
import 'package:time_tracker/constants/string_const.dart';
import 'package:time_tracker/dark_theme_style.dart';
import 'package:time_tracker/screens/signup.dart';
import 'package:time_tracker/widgets/button_widget.dart';
import 'package:time_tracker/widgets/widget_heading.dart';
import 'package:time_tracker/widgets/widget_textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  late FocusNode _name;
  late FocusNode _pass;
  bool isShowPass = false;

  @override
  void initState() {
    super.initState();
    _name = FocusNode();
    _pass = FocusNode();
  }

  @override
  void dispose() {
    _name.dispose();
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
            Center(child: HeadingWidget(text: strSignin)),
            const SizedBox(height: 20),
            GestureDetector(
              child: WidgetTextField(
                controller: nameController,
                focusNode: _name,
                hint: strfname,
                icon: "assets/icons/user.png",
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
            ),
            WidgetTextField(
              controller: passController,
              focusNode: _pass,
              hint: strpassword,
              icon: "assets/icons/password.png",
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
            ButtonWidget(strSignin, (){})
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          push(context, const SignUp());
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
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
    );
  }
}

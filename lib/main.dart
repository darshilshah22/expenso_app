import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/.env.dart';
import 'package:time_tracker/dark_theme_style.dart';
import 'package:time_tracker/providers/add_expense_provider.dart';
import 'package:time_tracker/providers/darktheme_provider.dart';
import 'package:time_tracker/providers/expand_dropdown_provider.dart';
import 'package:time_tracker/widgets/bottom_navigation_bar.dart';

import 'constants/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // set the publishable key for Stripe - this is mandatory
  Stripe.publishableKey = stripePublishableKey;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ExpandDropdownProvider()),
      ChangeNotifierProvider(create: (_) => AddExpenseProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: const BottomNavigation(),
          );
        },
      ),
    );
  }
}

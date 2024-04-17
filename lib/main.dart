import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:user_invest_iq/AuthView/Splashscreen.dart';
import 'package:user_invest_iq/Home.dart';
import 'package:user_invest_iq/AuthView/Login.dart';
import 'package:user_invest_iq/AuthView/Signup.dart';
import 'package:user_invest_iq/AuthView/Enteredscreen.dart';
import 'package:user_invest_iq/Provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invest-IQ',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: Splashscreen(),
    );
  }
}

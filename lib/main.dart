import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:user_invest_iq/AuthView/Splashscreen.dart';
import 'package:user_invest_iq/Home.dart';
import 'package:user_invest_iq/AuthView/Login.dart';
import 'package:user_invest_iq/AuthView/Signup.dart';
import 'package:user_invest_iq/AuthView/Enteredscreen.dart';
import 'package:user_invest_iq/Provider.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    print(message.notification!.title.toString());
  }
  if (kDebugMode) {
    print(message.notification!.body.toString());
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
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
      home: Splashscreen (),
    );
  }
}

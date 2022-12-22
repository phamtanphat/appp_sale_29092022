import 'package:appp_sale_29092022/presentation/features/detail/detail_page.dart';
import 'package:appp_sale_29092022/presentation/features/history/history_page.dart';
import 'package:appp_sale_29092022/presentation/features/home/home_page.dart';
import 'package:appp_sale_29092022/presentation/features/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      routes: {
        "/": (context) => const SignInPage(),
        "/home": (context) => const HomePage(),
        "/history": (context) => const HistoryPage(),
        "/detail": (context) => const DetailPage(),
      },
      initialRoute: '/',
    );
  }
}

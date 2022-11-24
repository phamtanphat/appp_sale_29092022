import 'package:appp_sale_29092022/presentation/features/sign_in/sign_in_page.dart';
import 'package:appp_sale_29092022/presentation/features/sign_up/sign_up_page.dart';
import 'package:appp_sale_29092022/presentation/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      routes: {
        "sign-in": (context) => SignInPage(),
        "sign-up": (context) => SignUpPage(),
        "splash": (context) => SplashPage(),
      },
      initialRoute: "splash",
    );
  }
}

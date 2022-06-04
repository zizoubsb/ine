import 'package:blogapp/screens/home.dart';
import 'package:blogapp/screens/login.dart';
import 'package:blogapp/screens/register.dart';
import 'package:blogapp/type_insc.dart';
//import 'package:blogapp/screens/Register.dart';
import 'package:flutter/material.dart';

//import 'screens/loading.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        //Home_agence
        // '/': (context) => const Home(),
        '/': (context) => const type(),

        '/second': (context) => const LoginScreen(),
        '/2': (context) => const RegisterScreen(),
      },
    );
  }
}

import 'dart:convert';

import 'package:blogapp/constant.dart';
import 'package:blogapp/helpers/Api.dart';
import 'package:blogapp/screens/post_screen.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';
  bool loading = false;
  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await Api.login(_email, _password);
      var responseMap = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Home()), (route) => false);
      } else {
        errorSnackBar(context, responseMap.values.first);
        bool loading = true;
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
      bool loading = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            // #login, #welcome
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Form(
                  child: ListView(
                    padding: EdgeInsets.all(32),
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) =>
                            val!.isEmpty ? 'Invalid email address' : null,
                        decoration: kInputDecoration('email'),
                        // obscureText: true,
                        onChanged: (value) {
                          _email = value;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,

                        validator: (val) => val!.length < 6
                            ? 'Required at least 6 chars'
                            : null,
                        decoration: kInputDecoration('password'),
                        obscureText: true,
                        // decoration: InputDecoration(labelText: 'Password'),

                        onChanged: (value) {
                          _password = value;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (_email.isNotEmpty && _password.isNotEmpty) {
                            setState(() {
                              loading = true;
                              loginPressed();
                            });
                          }
                        },
                        height: 45,
                        minWidth: 240,
                        shape: const StadiumBorder(),
                        color: Colors.blueAccent,
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      kLoginRegisterHint('Dont have an acount? ', 'Register',
                          () {
                        Navigator.pushNamed(context, '/2');
                      })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:blogapp/constant.dart';
import 'package:blogapp/helpers/Api.dart';
import 'package:blogapp/screens/home.dart';
import 'package:blogapp/screens/login.dart';
import 'package:blogapp/screens/post_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email = '';
  String _password = '';
  String _name = '';
  bool loading = false;
  createAccountPressed() async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
    if (emailValid) {
      http.Response response = await Api.register(_name, _email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const Home(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'email not valid');
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
                    "Sign in",
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 32),
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: kInputDecoration('Name'),
                        // obscureText: true,
                        //decoration: const InputDecoration(labelText: 'name'),
                        validator: (NameValue) {
                          if (NameValue!.isEmpty) {
                            return 'Please enter name';
                          }

                          return null;
                        },
                        onChanged: (value) {
                          _name = value;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        //obscureText: true,
                        decoration: kInputDecoration('Email'),
                        validator: (EmailValue) {
                          if (EmailValue!.isEmpty) {
                            return 'Please enter Email';
                          }

                          return null;
                        },
                        onChanged: (value) {
                          _email = value;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: kInputDecoration('Password'),
                        validator: (PasswordValue) {
                          if (PasswordValue!.isEmpty) {
                            return 'Please enter Password';
                          }

                          return null;
                        },
                        onChanged: (value) {
                          _password = value;
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ), //createAccountPressed()

                      MaterialButton(
                        onPressed: () {
                          if (_email.isNotEmpty && _password.isNotEmpty) {
                            setState(() {
                              loading = true;
                              createAccountPressed();
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
                        height: 20,
                      ),
                      kLoginRegisterHint('Already have an account? ', 'Login',
                          () {
                        Navigator.pushNamed(context, '/second');
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

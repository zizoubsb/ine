import 'package:blogapp/screens/client/login_client.dart';
import 'package:blogapp/screens/login.dart';

import 'package:flutter/material.dart';

class type extends StatefulWidget {
  const type({Key? key}) : super(key: key);

  @override
  State<type> createState() => _typeState();
}

class _typeState extends State<type> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            const SizedBox(
              height: 50,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => true);
              },
              height: 45,
              minWidth: 240,
              shape: const StadiumBorder(),
              color: Colors.blueAccent,
              child: Text(
                'agency',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => login_client()),
                    (route) => true);
              },
              height: 45,
              minWidth: 240,
              shape: const StadiumBorder(),
              color: Colors.blueAccent,
              child: Text(
                'client',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

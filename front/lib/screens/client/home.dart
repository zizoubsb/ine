import 'package:blogapp/screens/AddOfferView.dart';
import 'package:blogapp/screens/post_screen.dart';
import 'package:blogapp/type_insc.dart';
//import 'package:blogapp/screens/profile.dart';

import 'package:flutter/material.dart';

class Home_client extends StatefulWidget {
  const Home_client({Key? key}) : super(key: key);

  @override
  _Home_clientState createState() => _Home_clientState();
}

class _Home_clientState extends State<Home_client> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index

  Widget currentScreen = OffersListView(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => type()),
                (route) => false);
          },
          height: 45,
          minWidth: 240,
          shape: const StadiumBorder(),
          color: Colors.blueAccent,
          child: Text(
            'exit',
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

import 'package:blogapp/screens/AddOfferView.dart';
import 'package:blogapp/screens/post_screen.dart';
import 'package:blogapp/type_insc.dart';
//import 'package:blogapp/screens/profile.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index

  Widget currentScreen = OffersListView(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("Welcome!"),
            ),

            ListTile(
              title: Text('Add offer'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddOfferView()));
              },
            ),
            ListTile(
              title: Text('Offers'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OffersListView()));
              },
            ),
            // ListTile(
            //   title: Text('GPS'),
            //   onTap: () {
            //     // Update the state of the app.
            //     // ...
            //   },
            // ),
          ],
        ),
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

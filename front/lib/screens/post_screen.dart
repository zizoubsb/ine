import 'dart:convert';
//import 'dart:js';

import 'package:blogapp/helpers/Api.dart';

import 'package:flutter/material.dart';

class OffersListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OffersListState();
  }
}

class _OffersListState extends State<OffersListView> {
  var _offers = [];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    _loadOffers();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return Scaffold();
  }

  Widget _buildOfferItem(BuildContext context, int index) {
    return Card(
      child: ListTile(
        //leading: Image.network(Api().getOfferImageUrl(_meals[index]['Id'])),
        title: Text(_offers[index]['title'],
            style: TextStyle(color: Colors.black54)),
        subtitle: Text(_offers[index]['price'].toString(),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
  }

  _loadOffers() async {
    var response = await Api().getData('/offer');
    if (response.statusCode == 200) {
      setState(() {
        _offers = json.decode(response.body);
        _loading = _loading ? !_loading : _loading;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error ' + response.statusCode + ': ' + response.body),
      ));
    }
  }
}

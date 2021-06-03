import 'dart:async';

import 'package:flutter/material.dart';

class BrancesPage extends StatefulWidget {
  @override
  _BrancesPageState createState() => _BrancesPageState();
}

class _BrancesPageState extends State<BrancesPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              icon: Icon(
                Icons.map,
                color: Colors.red[600],
              ),
            alignment: Alignment.topRight,
          )
        ],
        elevation: 0,
        title: Text(
          'نقشه گوگل',
          style:
          TextStyle(
            fontSize: 16,
            color: Colors.red[600]
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back, color: Colors.grey,),
      ),
    );
  }
}
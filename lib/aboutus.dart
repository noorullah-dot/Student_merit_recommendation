// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Us',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))));
  }
}
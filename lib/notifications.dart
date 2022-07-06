import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({ Key? key }) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),

        title: Text('Merit Lists',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),centerTitle: true,),
      
    );
  }
}
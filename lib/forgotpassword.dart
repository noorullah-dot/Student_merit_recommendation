// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  late String _email;
  final auth = FirebaseAuth.instance;
  final _emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('Forgot Password',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),),
    body: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: _emailcontroller,
          keyboardType:TextInputType.emailAddress,
          decoration: InputDecoration(
             border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(30)),
            hintText: "Enter Email",
          ),
          onChanged: (value){
            setState(() {
              _email= value;
            });
    
          },),
          SizedBox( height:10),

          Container(height: 50,width: 400,
            decoration: BoxDecoration(shape: BoxShape.circle ),
            child: RaisedButton(color: Colors.blue,
              onPressed: ()
            {
              auth.sendPasswordResetEmail(email: _email);
              Navigator.of(context).pop();
            },
            child: Text('Reset Password',style: TextStyle(color: Colors.white),),),
          ),
          
      ],
    )


  
  );  
  }
}
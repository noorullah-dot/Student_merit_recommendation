// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:smr/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smr/user_model.dart';

class RigesterScreen extends StatefulWidget {
  const RigesterScreen({ Key? key }) : super(key: key);

  @override
  State<RigesterScreen> createState() => _RigesterScreenState();
}

class _RigesterScreenState extends State<RigesterScreen> {
  saveform(BuildContext context){
  }

TextEditingController fullnamecontroller  = TextEditingController();
TextEditingController emailcontrller = TextEditingController();
TextEditingController passwordcontrller = TextEditingController();
TextEditingController confirmpasswordcontrller = TextEditingController();

bool remember = false;
final _formkey = GlobalKey<FormState>();
FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {


    return Scaffold( 
      appBar: AppBar(title: Text('Student Merit Recommendation'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),),
     body: SafeArea(
        child: Padding(
        padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child:Lottie.asset('assets/registerscreen.json'),
                  ),
                  
                  TextFormField(
                  keyboardType: TextInputType.name,
                  autofocus: false,
                  controller: fullnamecontroller,
                   onSaved:(value)
                    {
                    fullnamecontroller.text=value !;
                    },
            
                    validator: (value){
                      RegExp regex = RegExp(r'^.{3,}$');
                          if (value!.isEmpty)
                              {
                            return ('Name cannot be Empty');
                              }
                          if (!regex.hasMatch(value)) 
                            {
                            return ("Enter valid name (Min. 3 Character)");
                              
                            }
                          else {
                            return null;
                          }
            
                    },
                  decoration: InputDecoration(labelText: 'Enter Your Full name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)))),
                  SizedBox(height: 10,),
                
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      // if(!emailcontrller.text.contains('@')){
                      //   return 'Please enter valid email';
                      // }
                      if(value!.isEmpty){
                        return "Please enter your email";
                      }
                      // ignore: valid_regexps
                      // if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-ZA-Z0-9.-]+. [a-z]").hasMatch(value))
                      //     {
                      //     return ("Please Enter a valid email");
                      //     }
                      else {return null;}
                    },
                    controller: emailcontrller,
                     onSaved:(value)
                      {
                        emailcontrller.text=value!;
                     },
                    decoration:InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    labelText: 'Enter email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)))),
                     
                  SizedBox(height: 10,),
            
                  TextFormField(
                    obscureText: true,
                    controller: passwordcontrller,
                    onSaved:(value)
                    {
                        passwordcontrller.text=value!;
                    },
                     validator: (value){
                      RegExp regex = RegExp(r'^.{6,}$');
                          if (value!.isEmpty)
                              {
                            return ('password is required for log in');
                              }
                          if (!regex.hasMatch(value)) 
                            {
                            return ("Enter valid password (Min. 6 Character)");
                              
                            }
                          else {
                            return null;
                          }
            
                    },
                    decoration: InputDecoration(labelText: 'Enter Password',
                    prefixIcon: Icon(Icons.vpn_key),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)))),
                  SizedBox(height: 10,),
                  
                
                  TextFormField(
                    obscureText: true,
                    controller: confirmpasswordcontrller,
                    onSaved:(value)
                    {
                        confirmpasswordcontrller.text=value!;
                    },
            
                    validator: (value){
                      if(confirmpasswordcontrller.text != passwordcontrller.text){
                        return "Password don't match";
                      }
                      else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.vpn_key),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)))),
                  SizedBox(height: 10),
                  Container( 
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                     color: Colors.blue[600],
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                    signUp(emailcontrller.text,passwordcontrller.text);
            
                    },child: Text(
                      'Register',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),),)
              ),
                ]),
            ),
        ),
      ),
    ));
  }
void signUp(String email,String password)async
 {
     if (_formkey.currentState!.validate())
  {
    await _auth
        .createUserWithEmailAndPassword(email:email,password:password)
        .then((value)=> {
          postDetailsToFirestore()
          })
        .catchError((e){
      Fluttertoast.showToast(msg:e!.message);
    });
  }

 }
 
  postDetailsToFirestore() async{

// calling our firestore
// calling our user model
// sedning these values
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  User?user=_auth.currentUser;
  UserModel userModel=UserModel();
  // writing all the values
  userModel.email=user!.email;
  userModel.uid=user.uid;
  userModel.fullname=fullnamecontroller.text;
  await firebaseFirestore
      .collection("users")
      .doc(user.uid)
      .set(userModel.toMap());
  Fluttertoast.showToast(msg:"Account created successfully");
  Navigator.pushAndRemoveUntil((context),MaterialPageRoute(builder: (context) => HomeScreen()),(route)=>false);

}


}

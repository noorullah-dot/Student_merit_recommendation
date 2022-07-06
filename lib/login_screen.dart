// ignore_for_file: prefer_const_constructors, valid_regexps, unused_label, deprecated_member_use, avoid_web_libraries_in_flutter, unused_import
import 'package:controller/controller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smr/forgotpassword.dart';
import 'package:smr/home_screen.dart';
import 'package:smr/register_screen.dart';
import 'package:get/get.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);
  
  //get controller => null;

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  late String email;
  
final _auth = FirebaseAuth.instance;
final _formkey = GlobalKey<FormState>();

bool _obsecure = true;
final TextEditingController emailcontroller = TextEditingController();
final TextEditingController passwordcontroller = TextEditingController();

@override
void dispose(){
  emailcontroller.dispose();
  super.dispose();

}


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.black87));
      return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              // it will take size of every screen e.g mbl,ipad,windows
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.20,
                  right: 35,
                  left: 35),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                     child: Lottie.asset('assets/login.json'),),
                      SizedBox(height: 8,),
                    
                    TextFormField(
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints:[AutofillHints.email],
                      onSaved:(value){
                      emailcontroller.text=value!;
                      email = value;
                      },
                   
                      validator: (email) => email != null && !EmailValidator.validate(email)
                      ? 'Enter valid email'
                      :null,
                           
                          //   if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-ZA-Z0-9.-]+. [a-z]").hasMatch(value))
                          // {
                          // return ("Please Enter a valid email");
                  
                        decoration: InputDecoration(
                        labelText: 'Enter Email',
                        prefixIcon: Icon(Icons.mail,color: Colors.blue,),
                        suffixIcon: IconButton(onPressed: ()=> emailcontroller.clear(), icon: Icon(Icons.close),),
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                        ),
                        
                    SizedBox(height: 20),
          
                    TextFormField(
                      obscureText: true,
                      controller: passwordcontroller,
                      onSaved:(value)
                      {
                        passwordcontroller.text=value!;
                      },
                      validator: (value) 
                      {
                        RegExp regex = RegExp(r'^.{6,}$');
                        if (value!.isEmpty)
                            {
                          return ('Password is required for login');
                            }
                       
                        else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                      labelText: 'Enter password',
                      prefixIcon: Icon(Icons.vpn_key,color: Colors.blue,),
                      suffixIcon: GestureDetector(
                        onTap :(){
                          setState(() {
                            _obsecure =! _obsecure;
                          });
                          
                          },
                          child:Icon(_obsecure ? Icons.visibility : Icons.visibility_off)
                      ),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
                    ),
                    Align(alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Forgotpassword()));
                        }, child: Text('Forgot Password? ',style: TextStyle(fontSize: 12,color: Colors.blue),)),
                    ),
                   
                     Container(width: 400, height: 60,decoration: BoxDecoration(shape: BoxShape.circle),
                       child: RaisedButton(
                         onPressed: ()
                         {
                           signIn(emailcontroller.text, passwordcontroller.text);
                           final form = _formkey.currentState!;
                           if(form.validate()){
                             final email = emailcontroller.text;
                           }
                         },
                         color: Colors.blue,
                         shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          child: Text('Sign in',style:TextStyle(fontSize: 15,color: Colors.white,),),),
                     ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                      Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child:FlatButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> RigesterScreen()));
                            }, child: Text('Not register yet? Register now',style: TextStyle(color: Colors.blue,fontSize: 12,),),
                                          ),
                      ),
                    
                    ],
                    ),
 
                    ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // login function
  void signIn(String email, String password) async 
  {
    if(_formkey.currentState!.validate())
    {
      await _auth.signInWithEmailAndPassword(email: email, password: password)
      .then ((uid) => {
        Fluttertoast.showToast(msg: "Login Successful",timeInSecForIosWeb: 1),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen())),
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message.toString());
      });
    } 
  }

  String?validateEmail(String?formEmail){
  if(formEmail == null || formEmail.isEmpty) {
    return'E-mail address is required.';
  }
    return null;

}

}

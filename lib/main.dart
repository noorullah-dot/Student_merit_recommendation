import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smr/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}   

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    
      title: 'Student Merit Recommendation',
      theme: ThemeData(
      scaffoldBackgroundColor: Color.fromARGB(255, 239, 241, 241)),
      // ignore: prefer_const_constructors
      home: MainScreen()
      //AnimatedSplashScreen(splash:Image.asset('assets/std.png') , nextScreen: Loginscreen()),
    );
  }
}
class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SplashScreen();
  }
}



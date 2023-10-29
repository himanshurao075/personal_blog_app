import 'dart:async';

import 'package:blog_assesment/AppSettings.dart';
import 'package:blog_assesment/Screens/Authentications/login_screen.dart';
import 'package:blog_assesment/Screens/Home/home_screen.dart';
import 'package:blog_assesment/data_layer/Storage/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () { 
      
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AppSettings.userModal.isUserLoggedIn ? HomeScreen():  LoginScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Lottie.asset("assets/lotties/logo.json",height: MediaQuery.of(context).size.height*0.2) ,),
        SizedBox(height: 30,),
        Text("Personal Blog App",style: TextStyle(fontWeight: FontWeight.w700,  color: Theme.of(context).primaryColor),textScaleFactor: 1.5,)
      ],
    ),);
  }
}
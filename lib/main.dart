import 'dart:io';

import 'package:flutter/material.dart';
import 'package:blooddonor/data/loginn.dart';
import 'package:blooddonor/data/data.dart';
import 'package:blooddonor/data/reg.dart';
import 'package:blooddonor/splash.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Blood Donor",
      theme: ThemeData(
          primarySwatch: Colors.orange
      ),

      home:SplashScreen(),
      debugShowCheckedModeBanner: false,

    );
  }
}

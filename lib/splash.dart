import 'package:flutter/material.dart';
import 'dart:async';

import 'package:blooddonor/intro.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
            (status) {
          if (status) {
            _navigateToHome();
          } else {
            _navigateToLogin();
          }
        }
    );
  }


  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});

    return true;
  }

  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => Home()
        )
    );
  }

  void _navigateToLogin(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => Home()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/bad.jpg"),fit: BoxFit.cover,),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         //Image.asset("assets/BLOOD13.png", height: 150, width: 150,),
         Image.asset("assets/blood20.png", height: 1, width: 1,),
//          Divider(
//            color: Colors.white,
//            height: 20,
//            thickness: 1,
//            indent:2,
//            endIndent: 2,
//          ),
          //SizedBox(height: 4,),
//          Text('Welcome to our online Blood Donation Management System.....  ', textAlign: TextAlign.center, style:TextStyle(
//              //fontWeight: FontWeight.bold,
//              fontSize: 20,
//              color: Colors.white
//          ),),
         /* SizedBox(height: 14,),
          Text('CENTERED ON BLOOD DONATION MANAGEMENT SYSTEM', textAlign: TextAlign.center, style:TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black
          ),), */

//          Divider(
//            color: Colors.white,
//            height: 20,
//            thickness: 1,
//            indent: 2,
//            endIndent: 2,
//          ),
        ],
      ),
    );


  }


}
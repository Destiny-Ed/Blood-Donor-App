import 'package:blooddonor/data/admin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blooddonor/data/reg.dart';
import 'package:blooddonor/data/loginn.dart';
import 'package:blooddonor/data/requester.dart';
import 'dart:convert';
import  'package:http/http.dart' as http;

//import 'package:http/http.dart' as http;
import 'package:blooddonor/intro.dart';
import 'package:blooddonor/pages/homepages.dart';

void main() => runApp(Welcome());

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donor',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
              }),
          title: Container(
            alignment: Alignment.center,
            child: Text('Blood Donation System',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          actions: <Widget>[

          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/bc.jpg"),fit: BoxFit.cover,
            ),
          ),
          key: _formKeyValue,
          // autovalidate: true,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            children: <Widget>[
              SizedBox(height: 50.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("Donor Login".toUpperCase(), style: TextStyle(fontSize: 20.0)),
                            ],
                          )),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Disco()));
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ],
              ),
              Divider(
                height: 12,
                thickness: 0.5,
                indent: 0.5,
                endIndent: 20,
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("Receiver Login".toUpperCase(), style: TextStyle(fontSize: 20.0)),
                            ],
                          )),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Requester()));
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ],
              ),
              Divider(
                height: 12,
                thickness: 0.5,
                indent: 0.5,
                endIndent: 20,
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("Admin Login".toUpperCase(), style: TextStyle(fontSize: 20.0)),
                            ],
                          )),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin()));
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ],
              ),
              SizedBox(height: 10,),

              Divider(
                height: 12,
                thickness: 0.5,
                indent: 0.5,
                endIndent: 20,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: <Widget>[
                  Text('You Do not Have An Account ?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("Sign Up", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                            ],
                          )),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

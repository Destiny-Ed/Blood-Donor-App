import 'package:blooddonor/data/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blooddonor/data/reg.dart';
//import 'package:blooddonor/data/MenuDashboardPage.dart';
import 'package:blooddonor/pages/homepages.dart';
import 'dart:convert';
import  'package:http/http.dart' as http;

//import 'package:http/http.dart' as http;
import 'package:blooddonor/intro.dart';
import 'package:blooddonor/pages/homepages.dart';

void main() => runApp(Disco());

class Disco extends StatelessWidget {
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

  TextEditingController user=new TextEditingController();
  TextEditingController mail = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  //TextEditingController pass=new TextEditingController();
  var selectedCurrency, selectedType;
  // ignore: missing_return
  String msg='';
  Future<List> _login() async {
    final response = await http.post("https://blood.upnepa.com.ng/index.php", body: {
      "username":user.text,
      "email":mail.text,


    });
    var datauser =json.decode(response.body);
    if(datauser.length==0){
      setState(() {
        msg="Incorrect Details";
      });
    }else{

      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>TabApp()));
      });
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage((),)));


    }
  }


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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome()));
              }),
          title: Container(
            alignment: Alignment.center,
            child: Text("DONOR",
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

          // autovalidate: true,
          child: new Form(
            key: _formKey,

            child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50.0),
              new TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Your Username';
                    }
                    return null;

                  },
                  controller: user,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    icon: const Icon(
                        Icons.supervised_user_circle,
                        color: Colors.white
                    ),

                    hintText: 'Enter your Username',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),

                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'username',
                      labelStyle: TextStyle(
                          color: Colors.white
                      )
                  ),
                  keyboardType: TextInputType.text
              ),

              new TextFormField(

                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Your Email';
                  }
                  return null;

                },
                controller: mail,
                style: TextStyle(color: Colors.white),

                decoration: const InputDecoration(

                  icon: const Icon(
                      Icons.email,
                      color: Colors.white
                  ),
                  hintText: 'Enter your Email Address',

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),

                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),

                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: Colors.white
                    )

                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                  Icon(
//                      Icons.my_location,
//                      size: 25.0,
//                      color: Colors.orange
//                  ),


                ],
              ),
              SizedBox(height: 30.0),

              Text(msg, textAlign: TextAlign.center, style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(

                      onPressed: () {
                        if(_formKey.currentState.validate()) {

                          _login();
                        }
                      },
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("Login Now".toUpperCase(), style: TextStyle(fontSize: 20.0)),
                            ],
                          )),

                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ],
              ),
              SizedBox(height: 10,),

              Divider(
                height: 10,
                thickness: 0.5,
                indent: 0.5,
                endIndent: 20,
              ),
              SizedBox(
                height: 10,
              ),

            ],
          ),
          )
        ));
  }
}

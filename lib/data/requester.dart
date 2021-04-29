import 'package:blooddonor/data/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blooddonor/data/reg.dart';
//import 'package:blooddonor/data/MenuDashboardPage.dart';
import 'dart:convert';
import  'package:http/http.dart' as http;

//import 'package:http/http.dart' as http;
import 'package:blooddonor/intro.dart';
import 'package:blooddonor/pages/requestorhome.dart';

void main() => runApp(Requester());

class Requester extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Requestor',
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


  //TextEditingController pass=new TextEditingController();
  var selectedCurrency, selectedType;
  // ignore: missing_return1`+
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
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(userNamee: user.text, diss: selectedType.toString(),)));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Requestor()));

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
            child: Text("REQUESTER",
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
              new TextFormField(
                  controller: user,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
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

              Text(msg, textAlign: TextAlign.center, style: TextStyle(color: Colors.red,
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
                      onPressed: () {
                        _login();
                      },
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
        ));
  }
}

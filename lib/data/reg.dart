import 'dart:async';
import 'dart:convert';
import 'package:blooddonor/data/welcome.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:blooddonor/data/loginn.dart';
import 'package:flutter/services.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
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
  @override
  bool visible = false;
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();

  var selectedCurrency, selectedType, bloodtype, rhesustype;
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  /* List<String> _accountType = <String>[
    'Abia',
    'Adamawa',
    'Akwa ibom',
    'Anambra',
    'Bauchi',
    'Bayelsa',
    'Abuja',
    'Benue',
    'Borno',
    'Cross river',
    'Delta',
    'Ebonyi',
    'Edo',
    'Ekiti',
    'Enugu',
    'Gombe',
    'Imo',
    'Jigawa',
    'Kaduna',
    'Kano',
    'Katsina',
    'Kebbi',
    'Kogi',
    'Kwara',
    'Lagos',
    'Nasarawa',
    'Niger',
    'Ogun',
    'Ondo',
    'Osun',
    'Oyo',
    'Plateau',
    'River',
    'Sokoto',
    'Taraba',
    'Yobe',
    'Zamfara',

  ];


  List<String> _bloodgroup = <String>[
    'A+',
    'O+',
    'O-',
    'AB',
  ];

  List<String> _rhesus = <String>[
    'Rh+',
    'Rh-',
  ];
*/
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Welcome()));
              }),
          title: Container(
            alignment: Alignment.center,
            child: Text("User Registration Form",
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          actions: <Widget>[],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bc.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          key: _formKeyValue,
          //autovalidate: true,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            children: <Widget>[
              SizedBox(height: 20.0),
              new TextFormField(
                controller: userController,
                //keyboardType: TextInputType.,
                inputFormatters: <TextInputFormatter>[
                  //WhitelistingTextInputFormatter.digitsOnly
                  // WhitelistingTextInputFormatter(RegExp("[a-z,A-Z ")),
                ],
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.supervised_user_circle,
                      color: Colors.white,
                    ),
                    hintText: 'Enter your User Name',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'User Name',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              new TextFormField(
                controller: phoneController,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    hintText: 'Enter your Phone Details',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(color: Colors.white)),
                keyboardType: TextInputType.number,
                autocorrect: true,
              ),
              /* new TextFormField(
                controller: passController,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.vpn_key,
                    color: Colors.white,
                  ),
                  hintText: 'Enter Your Password',

                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),

                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),

                  labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Colors.white
                    )
                ),
                obscureText: true,
                autocorrect: true,
              ), */

              new TextFormField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintText: 'Enter your Email Address',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white)),
                keyboardType: TextInputType.emailAddress,
                autocorrect: true,
              ),
              SizedBox(height: 15.0),
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
                              Text("Submit", style: TextStyle(fontSize: 24.0)),
                            ],
                          )),
                      onPressed: getData,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  Visibility(
                    visible: visible,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 7),
                      child: Center(child: CircularProgressIndicator()),
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Future getData() async {
    setState(() {
      visible = true;
    });
    //String fname=fnameController.text;
    //String lname=lnameController.text;
    String username = userController.text;
    String email = emailController.text;
    //String password=passController.text;
    String phone = phoneController.text;
    String destate = selectedType.toString();
    //String blood=bloodtype.toString();
    //String rhesus=rhesustype.toString();
    var url = 'https://blood.upnepa.com.ng/bloodd/index.php';
    var data = {
      'username': username,
      'phone': phone,
      'email': email,
      'state': destate,
    };
    var response = await http.post(url, body: json.encode(data));

    var message = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }
}

import 'dart:async';
import 'dart:convert';
// import 'dart:html';
import 'package:blooddonor/data/reg.dart';
import 'package:blooddonor/data/requester.dart';
import 'package:blooddonor/data/welcome.dart';
import 'package:blooddonor/pages/homepages.dart';
import 'package:blooddonor/pages/requestorhome.dart';
import 'package:flutter/material.dart';
import  'package:http/http.dart' as http;
import 'package:blooddonor/data/admindashboard.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:blooddonor/data/loginn.dart';
import  'homepages.dart';


void main() => runApp(Donor());

class Donor extends StatelessWidget {

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

  bool visible=false;

  final nameController= TextEditingController();
  final ageController= TextEditingController();

  final emailController= TextEditingController();
  final phoneController= TextEditingController();

  var selectedCurrency, selectedType, bloodtype, rhesustype;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();


  List<String> _bloodgroup = <String>[
    'A+',
    'A-',
    'O+',
    'O-',
    'AB+',
    'AB-',
    'B-',
    'B+',

  ];

  List<String> _rhesus = <String>[
    'Rh+',
    'Rh-',
  ];
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;

  @override
  void initState(){
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        resizeToAvoidBottomInset: false,   //new line
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepages()));

              }),

          title :  Container(
            alignment: Alignment.center,
            child: Text("Donate Blood",
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          actions: <Widget>[

          ],
        ),

        body: Container( decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bc.jpg"),fit: BoxFit.cover,
          ),
        ),
            key: _formKeyValue,



            child: new Form(
              key: _formKey,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  SizedBox(height: 10.0),
                  new TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Your Username';
                        }
                        return null;

                      },
                      controller: nameController,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          icon: const Icon(
                            Icons.people,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your Name',

                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),

                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),

                          labelText: 'Name',
                          labelStyle: TextStyle(
                              color: Colors.white
                          )
                      ),
                      keyboardType: TextInputType.text
                  ),
                  SizedBox(height: 10.0),
                  new TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Your Username';
                        }
                        return null;

                      },
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          icon: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your Email',

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
                      keyboardType: TextInputType.emailAddress
                  ),
                  SizedBox(height: 20.0),
                  new TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Your Username';
                        }
                        return null;

                      },
                      controller: ageController,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          icon: const Icon(
                            Icons.pets,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your Age',

                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),

                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),

                          labelText: 'Age',
                          labelStyle: TextStyle(
                              color: Colors.white
                          )
                      ),
                      keyboardType: TextInputType.text
                  ),
                  SizedBox(height: 20.0),

                  new TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Your Username';
                        }
                        return null;

                      },
                      controller: phoneController,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          icon: const Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your Phone Number',

                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),

                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),

                          labelText: ' Phone Number',
                          labelStyle: TextStyle(
                              color: Colors.white
                          )
                      ),
                      keyboardType: TextInputType.text
                  ),
                  SizedBox(height: 10.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.local_hospital,
                          size: 25.0,
                          color: Colors.white,
                        ),
                        SizedBox(width: 50.0),
                        DropdownButton(
                            items: _bloodgroup
                                .map((value) =>
                                DropdownMenuItem(
                                  child: Text(
                                    value,
                                    style: TextStyle(color: Colors.red, backgroundColor: Colors.cyanAccent, fontSize: 20),

                                  ),
                                  value: value,
                                ))

                                .toList(),
                            onChanged: (selectedAccountType) {
                              print('$selectedAccountType');
                              setState(() {
                                bloodtype = selectedAccountType;
                              });
                            },
                            value: bloodtype,
                            isExpanded: false,


                            hint: Text(
                              'Choose Your Blood Group',
                              style: TextStyle(color: Colors.white,
                              ),
                            )
                        )]
                  ),
                  SizedBox(height: 10.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Icon(
                          Icons.local_hospital,
                          size: 25.0,
                          color: Colors.white,
                        ),
                        SizedBox(width: 50.0),
                        DropdownButton(
                            items: _rhesus
                                .map((value) =>
                                DropdownMenuItem(
                                  child: Text(
                                    value,
                                    style: TextStyle(color: Colors.red, backgroundColor: Colors.cyanAccent, fontSize: 20),
                                  ),
                                  value: value,
                                ))
                                .toList(),
                            onChanged: (selectedAccountType) {
                              print('$selectedAccountType');
                              setState(() {
                                rhesustype = selectedAccountType;
                              });
                            },
                            value: rhesustype,
                            isExpanded: false,
                            hint: Text(
                              'Choose Your Rhesus Factor',
                              style: TextStyle(color: Colors.white,
                              ),
                            )
                        )]
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.location_searching,
                          size: 25.0,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10.0),

                        if (_currentPosition != null)
                          Text(_currentAddress, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                        if(_currentAddress == null)
                          FlatButton(
                            //child: Text("Tuned on your phone location, go back to the previous \n  page and come back again to authomatically pick \n your location", style: TextStyle(color: Colors.white,
                            child: Text("Get Location", style: TextStyle(color: Colors.white,
                            ) ),
                            onPressed: () {
                              _getCurrentLocation();
                            },
                          ),
                      ]
                  ),



                  SizedBox(
                    height: 30.0,
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
                                  Text("DONATE", style: TextStyle(fontSize: 24.0)),
                                ],
                              )),

                          onPressed : () {
                            if(_formKey.currentState.validate()) {

                              _Save();
                            }
                          },


                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                      Visibility(
                        visible: visible,
                        child: Container(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.cyanAccent,
                              valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                            )
                        ),
                      )
                    ],
                  ),
                ],
              ),


            )
        )
    );
  }


  /* _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {

    });
  }
  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality} ";

      });
    } catch (e) {

    }
  } */
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }
  _getAddressFromLatLng() async {

    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}";
      });
    } catch (e) {
      print(e);
    }
  }
  Future _Save() async{
    setState(() {
      visible=true;
    });
    String name=nameController.text;
    String age=ageController.text;

    String email=emailController.text;
    String phone=phoneController.text;
    String destate=_currentAddress;
    String blood=bloodtype.toString();
    String rhesus=rhesustype.toString();

    var url='https://blood.upnepa.com.ng/blooddonate/index.php';
    var data={'name': name, 'age':age, 'phone':phone, 'email':email,  'state':destate, 'bloodgroup':blood, 'rhesus':rhesus};
    var response= await http.post(url, body: json.encode(data));

    var message = jsonDecode(response.body);
    if(response.statusCode==200){
      setState(() {
        visible=false;
      });
    }

    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                  child: new Text("OK"),
                  //onPressed: (){
                  //  Navigator.of(context).pop();
                 //   Navigator.pop(context, MaterialPageRoute(builder: (context)=>Requester()));
                 // }
              )
            ],
          );
        }
    );


  }
}









/* import 'dart:async';
import 'dart:convert';
import 'package:blooddonor/data/welcome.dart';
import 'package:blooddonor/pages/homepages.dart';
import 'package:blooddonor/pages/requestorhome.dart';
import 'package:flutter/material.dart';
import  'package:http/http.dart' as http;
import 'package:blooddonor/data/admindashboard.dart';
import 'package:blooddonor/pages/requestorhome.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

 void main() => runApp(Requestorr());

class Requestorr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Request',
      theme: ThemeData(
        primaryColor: Colors.orange,
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
  final emailController= TextEditingController();
  final phoneController= TextEditingController();

  var selectedCurrency, selectedType, bloodtype, rhesustype;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();


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
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TabApp()));

              }),
          title: Container(
            alignment: Alignment.center,
            child: Text("Request Blood",
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

                  SizedBox(height: 20.0),
                  new TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Your name';
                        }
                        return null;

                      },
                      controller: nameController,
                      decoration: const InputDecoration(
                        icon: const Icon(
                          Icons.people,
                          color: Colors.orange,
                        ),
                        hintText: "Name",
                        labelText: 'Name',
                      ),
                      keyboardType: TextInputType.text
                  ),

                  SizedBox(height: 20.0),
                  new TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Your Email';
                        }
                        return null;

                      },
                      controller: emailController,
                      decoration: const InputDecoration(
                        icon: const Icon(
                          Icons.people,
                          color: Colors.orange,
                        ),
                        hintText: "Email",
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.text
                  ),
                  SizedBox(height: 20.0),
                  new TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Number';
                        }
                        return null;

                      },
                      controller: phoneController,
                      decoration: const InputDecoration(
                        icon: const Icon(
                          Icons.email,
                          color: Colors.orange,
                        ),
                        hintText: 'number',
                        labelText: 'Number',
                      ),
                      keyboardType: TextInputType.emailAddress
                  ),

                  SizedBox(height: 20.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.local_hospital,
                          size: 25.0,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 50.0),
                        DropdownButton(
                            items: _bloodgroup
                                .map((value) =>
                                DropdownMenuItem(
                                  child: Text(
                                    value,
                                    style: TextStyle(color: Colors.orange),
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
                              style: TextStyle(color: Colors.orange,
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
                          color: Colors.orange,
                        ),
                        SizedBox(width: 50.0),
                        DropdownButton(
                            items: _rhesus
                                .map((value) =>
                                DropdownMenuItem(
                                  child: Text(
                                    value,
                                    style: TextStyle(color: Colors.orange),
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
                              style: TextStyle(color: Colors.orange,
                              ),
                            )
                        )]
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                 /* Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.location_searching,
                          size: 25.0,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 50.0),
                        DropdownButton(
                            items: _accountType
                                .map((value) =>
                                DropdownMenuItem(
                                  child: Text(
                                    value,
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                  value: value,
                                ))
                                .toList(),
                            onChanged: (selectedAccountType) {
                              print('$selectedAccountType');
                              setState(() {
                                selectedType = selectedAccountType;
                              });
                            },
                            value: selectedType,
                            isExpanded: false,
                            hint: Text(
                              'Choose Your State of Resident',
                              style: TextStyle(color: Colors.orange,
                              ),
                            )
                        )]
                  ),


                  SizedBox(
                    height: 40.0,
                  ), */


                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.location_searching,
                          size: 25.0,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 10.0),

                        if (_currentPosition != null)
                          Text(_currentAddress),
                        if(_currentAddress == null)
                          FlatButton(
                            child: Text("GET YOUR LOCATION", style: TextStyle(color: Colors.orange,
                            ) ),
                            onPressed: () {
                              _getCurrentLocation();
                            },
                          ),
                      ]
                  ),



                  SizedBox(
                    height: 40.0,
                  ),






                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      RaisedButton(
                          color: Colors.orange,
                          textColor: Colors.white,
                          child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text("REQUEST", style: TextStyle(fontSize: 24.0)),
                                ],
                              )),

                          onPressed: () {
                            if(_formKey.currentState.validate()) {

                              _Save();
                            }
                          },


                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
//                  Visibility(
//                    visible: visible,
//                    child: Container(
//                      margin: EdgeInsets.only(bottom: 7),
//                      child: CircularProgressIndicator(),
//                      color: Colors.orange,
//                    ),
//                  )
                    ],
                  ),
                ],
              ),
            )
        ));
  }


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
        "${place.locality} ";

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

    String email=emailController.text;
    String phone=phoneController.text;
    String destate=selectedType.toString();
    String blood=bloodtype.toString();
    String rhesus=rhesustype.toString();

    var url='https://upnepa.com.ng/blood/bloodrequestor.php';
    var data={'name': name,  'phone':phone, 'email':email,  'state':destate, 'bloodgroup':blood, 'rhesus':rhesus};
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
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Requestor()));
                  }
              )
            ],
          );
        }
    );


  }
}*/
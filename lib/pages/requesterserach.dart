import 'dart:async';
import 'dart:convert';
import 'package:blooddonor/data/search.dart';
import 'package:blooddonor/data/welcome.dart';
import 'package:blooddonor/pages/requestorhome.dart';
import 'package:flutter/material.dart';
import 'package:blooddonor/pages//homepages.dart';
import 'package:http/http.dart' as http;
import 'package:blooddonor/data/admindashboard.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(Requestersearch());

class Requestersearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Requester',
      theme: ThemeData(primaryColor: Colors.red),
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

  var selectedCurrency, selectedType, bloodtype, rhesustype;
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

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Requestor()));
              }),
          title: Container(
            alignment: Alignment.center,
            child: Text("Search for Blood",
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
              SizedBox(height: 70.0),

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
                            .map((value) => DropdownMenuItem(
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        color: Colors.red,
                                        backgroundColor: Colors.cyanAccent,
                                        fontSize: 20),
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
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ))
                  ]),
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
                          .map((value) => DropdownMenuItem(
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      color: Colors.red,
                                      backgroundColor: Colors.cyanAccent,
                                      fontSize: 20),
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
                      hint: Text('Choose Your Rhesus Factor',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    )
                  ]),
              SizedBox(
                height: 20.0,
              ),
//              Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Icon(
//                      Icons.location_searching,
//                      size: 25.0,
//                      color: Colors.orange,
//                    ),
//                    SizedBox(width: 50.0),
//                    DropdownButton(
//                        items: _accountType
//                            .map((value) =>
//                            DropdownMenuItem(
//                              child: Text(
//                                value,
//                                style: TextStyle(color: Colors.orange),
//                              ),
//                              value: value,
//                            ))
//                            .toList(),
//                        onChanged: (selectedAccountType) {
//                          print('$selectedAccountType');
//                          setState(() {
//                            selectedType = selectedAccountType;
//                          });
//                        },
//                        value: selectedType,
//                        isExpanded: false,
//                        hint: Text(
//                          'Choose Your State of Resident',
//                          style: TextStyle(color: Colors.orange,
//                          ),
//                        )
//                    )]
//              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.location_searching,
                      size: 23.0,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.0),
                    if (_currentPosition != null)
                      Text(
                        "$_currentAddress",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    if (_currentAddress == null)
                      FlatButton(
                        child: Text("Get your location",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          _getCurrentLocation();
                        },
                      ),
                  ]),

              SizedBox(
                height: 40.0,
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
                              Text("SEARCH", style: TextStyle(fontSize: 24.0)),
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
                      color: Colors.orange,
                    ),
                  )
                ],
              ),
            ],
          ),
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
    }).catchError((e) {});
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress = "${place.locality}";
      });
    } catch (e) {}
  }

  Future getData() async {
    setState(() {
      visible = true;
    });

    String destate = selectedType.toString();
    String blood = bloodtype.toString();
    String rhesus = rhesustype.toString();

    //
    var url = 'https://blood.upnepa.com.ng/blood/index.php';
    var data = {'bloodgroup': blood, 'rhesus': rhesus};
    var response = await http.post(url, body: json.encode(data));

    if (response.statusCode == 200) {
      var message = jsonDecode(response.body);
      print("Success Response $message");

      setState(() {
        visible = false;
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Search(
                    searchResult: message,
                  )));
    } else {
      var errorMessage = jsonDecode(response.body);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text(errorMessage),
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
}
